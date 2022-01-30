//
//  NetworkService.swift
//  Notion Database
//
//  Created by Alex Paul on 1/30/22.
//

import Foundation

class NetworkService{
    
    static let shared = NetworkService()
    
    let urlString = "https://api.notion.com/v1/databases/2e0e5e7ecc9f4505833b69b092407b0f/query"
    
    func getJSON(completion: @escaping ([Result]?) -> Void){
        guard let url = URL(string: urlString ) else{
            return
        }
        var request =  URLRequest(url: url)
        let headers = ["Accept": "application/json","Notion-Version": "2021-08-16"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.setValue ("secret_IMisjufCuFJd1LecEjgGCL63jFI2K2d8Ua2GVQDvEeu", forHTTPHeaderField: "Authorization")
        request.setValue ("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
                let decodedJson = try decoder.decode(Database.self, from: data).results
                DispatchQueue.main.async {
                    completion(decodedJson)
                }
            }catch let error{
                print(error)
                return
            }
            
        }.resume()
    }
}

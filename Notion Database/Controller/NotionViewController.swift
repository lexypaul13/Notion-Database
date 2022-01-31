//
//  ViewController.swift
//  Notion Database
//
//  Created by Alex Paul on 1/30/22.
//

import UIKit

class NotionViewController: UIViewController {
    let networkService = NetworkService.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNameAndTags()
    }
    
    
    func getNameAndTags(){
        networkService.getJSON { results in
            guard let results = results else {
                return
            }
            for result in results {
                let name = result.properties.name.title.map { $0.plainText }
                let tags = result.properties.tags.multiSelect.map { $0.name }
                print("\(name) - \(tags)")
            }
        }
    }
    
}


//
//  ViewController.swift
//  Notion Database
//
//  Created by Alex Paul on 1/30/22.
//

import UIKit

class NotionViewController: UIViewController {
    
    let networkService = NetworkService.shared
    var names = [String]()
    var tags =  [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        getNamesAndTags()
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getNamesAndTags(){
        networkService.getJSON {  [weak self ] results in
            guard let self = self else { return}
            guard let results = results else {return}
            for result in results {
                self.names = result.properties.name.title.map { $0.plainText }
                self.tags = result.properties.tags.multiSelect.map { $0.name }
               
                print(self.names)
                print(self.tags)
            }
            self.tableView.reloadData()

        }
    }
    
}
extension NotionViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NotionTableViewCell
        cell?.nameLabel.text = names[indexPath.row]
        cell?.tagLabel.text = tags[indexPath.row]
        return cell!
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
}

//
//  ViewController.swift
//  Project1
//
//  Created by Consultant on 26/03/1401 AP.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

}


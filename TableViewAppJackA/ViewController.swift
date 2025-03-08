//
//  ViewController.swift
//  TableViewAppJackA
//
//  Created by student on 3/6/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let tableData = [
        ["Movies 🎬", "Lord of the Rings", "Terminator 2", "Gladiator"],
        ["Music 🎶", "Sweet Child of Mine", "Brick in the Wall", "Can't Hold Us"],
        ["Food 🍕", "Pizza", "Rice", "Chips and Salsa"],
        ["TV Shows 📺", "Breaking Bad", "Better Call Saul", "Sopranos"]
    ]


    @IBOutlet var mainTableView: UITableView!
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default,
                reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = tableData[indexPath.row][0]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationVC = segue.destination as! SubViewController
            if let indexPath = mainTableView.indexPathForSelectedRow {
                let selectedData = tableData[indexPath.row]
                destinationVC.receivedData = selectedData
            }
        }
    }
}


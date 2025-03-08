//
//  SubViewController.swift
//  TableViewAppJackA
//
//  Created by student on 3/6/25.
//

import Foundation
import UIKit

class SubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var receivedData: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = receivedData[0]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedData.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = receivedData[indexPath.row + 1]
        return cell
    }
}

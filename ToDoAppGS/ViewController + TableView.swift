//
//  ViewController + TableView.swift
//  ToDoAppGS
//
//  Created by guseyn on 05.02.2024.
//

import Foundation
import UIKit
private let items: [CategoryCells] = [
    CategoryCells(icon: UIImage(named: "all"), count: "5", text: "Все"),
    CategoryCells(icon: UIImage(named: "family"), count: "3", text: "Семья"),
    CategoryCells(icon: UIImage(named: "work"), count: "4", text: "Работа")
]
extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count / tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksService", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.detailTextLabel?.text = task.comm
        return cell
    }
}

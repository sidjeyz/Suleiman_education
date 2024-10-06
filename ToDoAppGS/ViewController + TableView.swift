//
//  ViewController + TableView.swift
//  ToDoAppGS
//
//  Created by guseyn on 05.02.2024.
//

import Foundation
import UIKit
//private let items: [CategoryCells] = [
  //  CategoryCells(icon: UIImage(named: "all"), count: "5", text: "Все"),
    //CategoryCells(icon: UIImage(named: "family"), count: "3", text: "Семья"),
    //CategoryCells(icon: UIImage(named: "work"), count: "4", text: "Работа")
//]
extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //#error("Сделать логику после нажатия на ячейку")
        print(tasks[indexPath.row])
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count / tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //#error("Ячейка может быть разной высоты")
        return UITableView.automaticDimension
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemporaryCell", for: indexPath) as! TemporaryCell
        let task = tasks[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        cell.configure(title: task.title! , date: dateFormatter.string(from: task.date!), image: UIImage(named: "offButton")!)
        return cell
    }
}

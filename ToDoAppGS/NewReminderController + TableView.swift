//
//  ViewController2 + TableView.swift
//  ToDoAppGS
//
//  Created by Сулейман on 25.02.2024.
//

import Foundation
import UIKit

extension NewReminderController: NewReminderDelegete{
    func textViewDidEndEditing(text: String) {
        print("Received text from cell: \(text)")

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        switch item{
            
        case .doc(let docItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DocCell", for: indexPath) as! DocCell
            cell.configure(text: docItem.title, image: docItem.image, switchState: docItem.switcher)
            return cell
        case .comm(let commItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommCell", for: indexPath) as! CommCell
            cell.configure(comm: commItem.comm)
            cell.delegate = self
            return cell
        case .title(let titleItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.configure(title: titleItem.title)
            cell.delegate = self
            return cell
        case .list(let listItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
            cell.configure(icon: listItem.icon, list: listItem.list, category: listItem.category)
            return cell
        case .date(let dateItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerCell
            cell.configure(date: dateItem.date)
            return cell
        }
     
    }
    
}

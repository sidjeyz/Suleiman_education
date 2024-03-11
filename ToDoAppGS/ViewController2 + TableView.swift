//
//  ViewController2 + TableView.swift
//  ToDoAppGS
//
//  Created by Сулейман on 25.02.2024.
//

import Foundation
import UIKit
struct Section{
    let items: [Cell]
}
struct DocCells {
    let image: UIImage?
    let title: String
    let switcher: Bool
}

struct CommCells{
    let comm: String
}

struct TitleCells{
    let title: String
}

struct ListCells{
    let icon: UIImage?
    let list: String
    let category: String
}

enum Cell{
    case doc(DocCells)
    case comm(CommCells)
    case title(TitleCells)
    case list(ListCells)
}

extension ViewController2{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secs[section].items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return secs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = secs[indexPath.section].items[indexPath.row]
        switch item{
            
        case .doc(let docItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DocCell", for: indexPath) as! DocCell
            cell.configure(text: docItem.title, image: docItem.image, switchState: docItem.switcher)
            return cell
        case .comm(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommCell", for: indexPath) as! CommCell
            cell.configure(comm: "")
            return cell
        case .title(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.configure(title: "")
            return cell
        case .list(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
            cell.configure(icon: UIImage(named: "Image"), list: "Список", category: "Все")
            return cell
        }
     
    }

    
}

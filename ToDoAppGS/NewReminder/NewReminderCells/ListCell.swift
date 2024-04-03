//
//  ListCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 12.03.2024.
//

import Foundation
import UIKit
class ListCell: UITableViewCell{
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var listIconImageView: UIImageView!
    @IBOutlet weak var listCategoryLabel: UILabel!
    
    func configure(icon: UIImage?, list: String, category: String){
        listLabel.text = list
        listIconImageView.image = icon
        listCategoryLabel.text = category
        self.accessoryType = .disclosureIndicator
    }
    struct ListCells{
        let icon: UIImage?
        let list: String
        let category: String
    }
}

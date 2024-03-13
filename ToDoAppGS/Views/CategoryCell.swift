//
//  CategoryCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 12.03.2024.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var tasksCountLabel: UILabel!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryIconImageView: UIImageView!
    
    func configure(icon: UIImage?, text: String, count: String){
        categoryTitleLabel.text = text
        categoryIconImageView.image = icon
        tasksCountLabel.text = count
    }
    
}
struct CategoryCells{
    let icon: UIImage?
    let count: String
    let text: String
}



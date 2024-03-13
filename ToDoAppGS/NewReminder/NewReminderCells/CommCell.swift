//
//  CommCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 13.03.2024.
//

import Foundation
import UIKit
class CommCell: UITableViewCell{
    
    @IBOutlet weak var commTextView: UITextView!
    
    func configure(comm: String){
        commTextView.text = comm
    }
}

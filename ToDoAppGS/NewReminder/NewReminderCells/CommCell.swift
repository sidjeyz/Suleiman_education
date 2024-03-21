//
//  CommCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 13.03.2024.
//

import Foundation
import UIKit
class CommCell: UITableViewCell{
    weak var delegate: NewReminderController?
    
    @IBOutlet weak var commTextView: UITextView!
    
    func configure(comm: String){
        commTextView.text = comm
    }
    func textViewDidEndEditing(_ textView: UITextView) {
            delegate?.textViewDidEndEditing(text: textView.text)
        }
}

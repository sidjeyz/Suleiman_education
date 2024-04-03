//
//  CommCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 13.03.2024.
//

import Foundation
import UIKit
class CommCell: UITableViewCell, UITextViewDelegate{
    weak var delegate: NewReminderController?
    
    @IBOutlet weak var commTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commTextView.delegate = self
    }
    func configure(comm: String) {
        commTextView.text = comm
    }
            
    @objc func textViewDidChange(_ textView: UITextView) {
        delegate?.commTextDidChange(text: textView.text)
    }

}

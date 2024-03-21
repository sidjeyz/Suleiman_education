//
//  TitleCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 12.03.2024.
//

import Foundation
import UIKit
class TitleCell: UITableViewCell, UITextFieldDelegate{
    
    weak var delegate: NewReminderDelegete?
    @IBOutlet weak var titleTextField: UITextField!
    var savedText: String = " "
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.delegate = self
    }
    func configure(title: String){
        titleTextField.text = title
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
            delegate?.textViewDidEndEditing(text: textView.text)
        }

}


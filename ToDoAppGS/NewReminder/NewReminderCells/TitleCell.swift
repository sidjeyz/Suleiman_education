//
//  TitleCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 12.03.2024.
//

import Foundation
import UIKit
class TitleCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var titleTextField: UITextField!
    weak var delegate: NewReminderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
        titleTextField.delegate = self
    }
    
    func configure(title: String){
        titleTextField.text = title
    }
    
    @objc private func textDidChange(textField: UITextField){
        delegate?.titleTextDidChange(text: textField.text!)
    }
}


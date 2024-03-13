//
//  TitleCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 12.03.2024.
//

import Foundation
import UIKit
class TitleCell: UITableViewCell, UITextFieldDelegate{
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        titleTextField.delegate = self
    }
    
    func configure(title: String){
        titleTextField.text = title
    }
    
}
extension NewReminderController: UITextFieldDelegate{
    
}

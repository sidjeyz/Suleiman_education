//
//  DataPicker.swift
//  ToDoAppGS
//
//  Created by Сулейман on 18.03.2024.
//

import Foundation
import UIKit
class DatePickerCell: UITableViewCell{
    
    @IBOutlet weak var datePickerForSwitch: UIDatePicker!
    
    func configure(date: Date){
        datePickerForSwitch.date = date
    }
}

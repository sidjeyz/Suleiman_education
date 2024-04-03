//
//  TimeCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 26.03.2024.
//

import Foundation
import UIKit
class TimeCell: UITableViewCell{
    
    @IBOutlet weak var timePicker: UIDatePicker!
    func configure(time: Date){
        timePicker.date = time
        timePicker.minimumDate = Date()
    }
}

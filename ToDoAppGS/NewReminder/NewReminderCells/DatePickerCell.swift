//
//  DataPicker.swift
//  ToDoAppGS
//
//  Created by Сулейман on 18.03.2024.
//

import Foundation
import UIKit
class DatePickerCell: UITableViewCell{
    weak var delegate: NewReminderController?
    @IBOutlet weak var datePickerForSwitch: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        datePickerForSwitch.addTarget(self, action: #selector(dateDidChange(_ : )), for: .valueChanged)
    }
    
    func configure(date: Date){
        datePickerForSwitch.date = date
        datePickerForSwitch.minimumDate = Date()
    }
    @objc private func dateDidChange(_ datePicker: UIDatePicker){
        delegate?.dateDidChange(date: datePicker.date)
    }
}

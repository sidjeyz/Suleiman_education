//
//  TimeCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 26.03.2024.
//

import Foundation
import UIKit
class TimeCell: UITableViewCell{
    weak var delegate: NewReminderController?
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timePicker.addTarget(self, action: #selector(timeDidChange(_ : )), for: .valueChanged)
    }
    
    func configure(time: Date){
        timePicker.date = time
        timePicker.minimumDate = Date()
    }
    
    @objc private func timeDidChange(_ timePicker: UIDatePicker){
        delegate?.timeDidChange(time: timePicker.date)
    }
}

//
//  DocCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 13.03.2024.
//

import Foundation
import UIKit
class DocCell: UITableViewCell{
    @IBOutlet weak var docSwitch: UISwitch!
    @IBOutlet weak var docLabel: UILabel!
    @IBOutlet weak var docImageView: UIImageView!
    
    enum CellType {
            case date
            case time
        }
    var cellType: CellType?

    weak var controllerDelegate: NewReminderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        docSwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
    }
    @objc private func toggleSwitch() {
            guard let cellType = cellType else { return }
            
            switch cellType {
            case .date:
                controllerDelegate?.didToggleDate(docSwitch.isOn)
            case .time:
                controllerDelegate?.didToggleTime(docSwitch.isOn)
            }
        }

    
    func configure(text: String, image: UIImage?, switchState: Bool, type: CellType){
        docLabel.text = text
        docImageView.image = image
        docSwitch.isOn = switchState
        cellType = type
    }
}

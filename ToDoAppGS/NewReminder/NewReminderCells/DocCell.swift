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
    func configure(text: String, image: UIImage?, switchState: Bool){
        docLabel.text = text
        docImageView.image = image
        docSwitch.isOn = switchState
    }
}

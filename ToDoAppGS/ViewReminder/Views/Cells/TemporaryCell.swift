//
//  TempoparyCell.swift
//  ToDoAppGS
//
//  Created by Сулейман on 05.05.2024.
//

import Foundation
import UIKit
class TemporaryCell: UITableViewCell {
    
    
    @IBOutlet weak var temporaryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var originalImage: UIImage?
    var alternateImage: UIImage?

    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            temporaryImageView.isUserInteractionEnabled = true
            temporaryImageView.addGestureRecognizer(tapGestureRecognizer)
        
            originalImage = UIImage(named: "offButton")
            alternateImage = UIImage(named: "onButton")

        }

    
    func configure(title: String, date: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        temporaryImageView.image = image
    }
    
    @objc func imageTapped() {

            if temporaryImageView.image == originalImage {
                temporaryImageView.image = alternateImage
            } else {
                temporaryImageView.image = originalImage
            }

        
        }

    
}

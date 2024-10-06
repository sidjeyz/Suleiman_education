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
    
    var isStrikethrough = false
    
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

                if let text = titleLabel.text {
                    let attributedString = NSMutableAttributedString(string: text)

                    if isStrikethrough {
                        attributedString.removeAttribute(.strikethroughStyle, range: NSRange(location: 0, length: attributedString.length))
                    } else {
                        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
                    }

                    titleLabel.attributedText = attributedString
                    isStrikethrough.toggle()
                }
            }

}

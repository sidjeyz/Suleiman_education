//
//  LoadingView.swift
//  ToDoAppGS
//
//  Created by Гусейн Римиханов on 26.09.2024.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    func setText(_ text: String) {
        self.loadingLabel.text = text
    }
    
}

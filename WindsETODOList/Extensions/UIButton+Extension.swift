//
//  UIButton+Extension.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
import UIKit
public extension UIButton {
    func applyStyles(text: String,
                     textColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont) {
        
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
        
    }
    
    func updateLayerProperties() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
}

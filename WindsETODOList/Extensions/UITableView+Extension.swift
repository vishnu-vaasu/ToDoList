//
//  UITableView+Extension.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
import UIKit
public extension UITableView {
   
    //MARK : To show message when Records are empty
    func emptyMessage(message: String) {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.bounds.size.width, height: self.self.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
}

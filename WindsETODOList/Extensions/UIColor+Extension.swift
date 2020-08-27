//
//  UIColor+Extension.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
import UIKit
public extension UIColor {
    convenience init(for hexCode: String) {
        self.init()
    }

    func hexToUIColor(with hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func rgbToUIColor(with rValue: CGFloat, gValue: CGFloat, bValue: CGFloat) -> UIColor {
        var r, g, b: CGFloat
        r = 255.0
        g = 255.0
        b = 255.0
        r = CGFloat(truncating: NSNumber(nonretainedObject: rValue))
        g = CGFloat(truncating: NSNumber(nonretainedObject: gValue))
        b = CGFloat(truncating: NSNumber(nonretainedObject: bValue))
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1.0)
    }
}

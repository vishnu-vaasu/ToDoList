//
//  FontLoader.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
import UIKit
public struct FontLoader {
    public static func regularFont(with value: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: value, weight: .regular)
    }

    public static func mediumFont(with value: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: value, weight: .medium)
    }

    public static func boldFont(with value: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: value, weight: .bold)
    }
}

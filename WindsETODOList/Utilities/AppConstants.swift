//
//  AppConstants.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
import UIKit

public struct AppConstants {
    public static let APP_THEME_TEXT_COLOR = UIColor().hexToUIColor(with: "#63666A")
    public static let APP_THEME_COLOR = UIColor().hexToUIColor(with: "#84754E")
    public static let APP_THEME_Cancel_COLOR = UIColor.red.withAlphaComponent(0.8)
    public static let APP_THEME_Submit_COLOR = UIColor().hexToUIColor(with: "#00d785")
    public static let APPNAME = "To Do List"
    public static var plistURL : URL {
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL.appendingPathComponent("TodoDetails.plist")
    }
}

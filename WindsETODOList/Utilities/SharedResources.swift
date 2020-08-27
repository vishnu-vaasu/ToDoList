//
//  SharedResources.swift
//  WindsETODOList
//
//  Created by Vishnu on 26/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
class SharedResources {
    private static var _sharedResources: SharedResources?
    private init() {
        
    }
    static var sharedResources: SharedResources {
        if _sharedResources == nil {
            _sharedResources = SharedResources()
        }
        return _sharedResources!
    }
    public var todoDetails: [ToDo] = []
}

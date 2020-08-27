//
//  ToDoModel.swift
//  WindsETODOList
//
//  Created by Vishnu on 27/08/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import Foundation
struct ToDo {
    let title: String?
    let description: String?
    let selected: Bool
    
    init(title: String, description: String, selected: Bool = false) {
        self.title = title
        self.description = description
        self.selected = selected
    }
}
extension ToDo : Codable {

    private enum CodingKeys : CodingKey {
        case title, description, selected
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.selected = try container.decode(Bool.self, forKey: .selected)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(selected, forKey: .selected)
    }
}

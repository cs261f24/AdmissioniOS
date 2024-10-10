//
//  Item.swift
//  XavierMapApp
//
//  Created by Eric Alley on 9/24/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

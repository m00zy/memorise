//
//  Item.swift
//  Memorise
//
//  Created by Maxwell Zhu on 17/07/2024.
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

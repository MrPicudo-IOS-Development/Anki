//
//  Card.swift
//  Anki
//
//  Created by Jose Miguel Torres Chavez Nava on 13/04/24.
//

import SwiftData
import SwiftUI

@Model
final class Card {
    var front: String
    var back: String
    
    init(front: String, back: String) {
        self.front = front
        self.back = back
    }
}

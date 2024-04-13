//
//  AnkiApp.swift
//  Anki
//
//  Created by Jose Miguel Torres Chavez Nava on 13/04/24.
//

import SwiftData
import SwiftUI

@main
struct AnkiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Configura el contenedor del modelo para el tipo 'Card'.
        .modelContainer(for: Card.self)
    }
}

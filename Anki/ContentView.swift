//
//  ContentView.swift
//  Anki
//
//  Created by Jose Miguel Torres Chavez Nava on 13/04/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    // Utiliza el contexto del modelo para realizar operaciones de base de datos.
    @Environment(\.modelContext) var modelContext
    // Recupera todas las cartas almacenadas usando una consulta.
    @Query var cards: [Card]
    // Almacena el texto del frente y del reverso de la tarjeta.
    @State private var front: String = ""
    @State private var back: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Group {
                // Campos de texto para introducir el frente y el reverso de la tarjeta.
                TextField("Card front", text: $front)
                TextField("Card back", text: $back)
            }
            .padding()
            .background(Color.gray.opacity(0.4))  // Añade un fondo semi-transparente.
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .padding(.horizontal, 20)
            
            Button {
                // Crea una nueva tarjeta con el texto introducido y la inserta en la base de datos.
                let card = Card(front: front, back: back)
                modelContext.insert(card)
            } label: {
                Text("Add")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
            }
            .disabled(front.isEmpty || back.isEmpty)  // Deshabilita el botón si los campos están vacíos.
            .padding()
            .background(Color.blue.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            
            GeometryReader { geometry in
                let width = geometry.size.width
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: width > 600 ? 5 : 3)
                ScrollView {
                    // Muestra las cartas en un grid, permitiendo la visualización y la interacción.
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                        ForEach(cards) { card in
                            FlipView(card: card)
                        }
                    }
                    .padding()
                }.padding(.top, 20) // Controla la distancia entre el LazyVGrid y el botón "Add"
            }
        }
    }
}


#Preview {
    ContentView()
}

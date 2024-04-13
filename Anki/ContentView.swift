//
//  ContentView.swift
//  Anki
//
//  Created by Jose Miguel Torres Chavez Nava on 13/04/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var cards: [Card]
    @State private var front: String = ""
    @State private var back: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Group {
                TextField("Card front", text: $front)
                TextField("Card back", text: $back)
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .padding(.horizontal, 20)
            
            Button {
                let card = Card(front: front, back: back)
                modelContext.insert(card)
            } label: {
                Text("Add")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
            }
            .disabled(front.isEmpty || back.isEmpty)
            .padding()
            .background(Color.blue.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            
            GeometryReader { geometry in
                let width = geometry.size.width
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: width > 600 ? 5 : 3)
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                        ForEach(cards) { card in
                            FlipView(card: card)
                        }
                    }
                }.padding(.vertical, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}

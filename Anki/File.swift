/*
 

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
        .modelContainer(for: Card.self)
    }
}


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
                    .padding()
                }.padding(.top, 20) // Controls the distance between the LazyVGrid and the button "Add"
            }
        }
    }
}


//
//  FlipView.swift
//  Anki
//
//  Created by Jose Miguel Torres Chavez Nava on 13/04/24.
//


import SwiftUI

struct FlipView: View {
    var card: Card
    @State private var isFlipped = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
                ZStack {
                    Group {
                        Text(card.front)
                            .font(.footnote)
                            .frame(minWidth: 0.0, maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .stroke(colorScheme == .dark ? Color.gray.opacity(0.6) : Color.gray, lineWidth: 3.0))
                            .background(colorScheme == .dark ? Color.gray.opacity(0.2) : Color.gray.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(isFlipped ? 0 : 1)
                            .rotation3DEffect(
                                .degrees(isFlipped ? -180 : 0),
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }

                    Group {
                        Text(card.back)
                            .font(.footnote)
                            .frame(minWidth: 0.0, maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .stroke(colorScheme == .dark ? Color.blue.opacity(0.6) : Color.blue, lineWidth: 3.0))
                            .background(colorScheme == .dark ? Color.blue.opacity(0.2) : Color.blue.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(isFlipped ? 1 : 0)
                            .rotation3DEffect(
                                .degrees(isFlipped ? 0 : 180),
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                }
                .onTapGesture {
                    withAnimation(.linear(duration: 0.3)) {
                        isFlipped.toggle()
                    }
                }
        }
    }
}


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


*/

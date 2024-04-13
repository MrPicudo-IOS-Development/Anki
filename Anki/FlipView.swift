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
                // Vista para el frente de la tarjeta.
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
                // Vista para el reverso de la tarjeta.
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
            // Al tocar la tarjeta, se invierte el estado de 'isFlipped', activando la animación.
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    isFlipped.toggle()
                }
            }
        }
    }
}

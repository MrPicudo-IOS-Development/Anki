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
    // Variable de ambiente para detectar el modo claro y oscuro del iPhone.
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            if isFlipped {
                Text(card.back)
                    .font(.footnote)
                    .transition(.flipFromLeft)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(colorScheme == .dark ? Color.blue.opacity(0.6) : Color.blue, lineWidth: 3.0)
                    )
            } else {
                Text(card.front)
                    .font(.footnote)
                    .transition(.flipFromRight)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(colorScheme == .dark ? Color.gray.opacity(0.6) : Color.gray, lineWidth: 3.0)
                    )
            }
        }
        .background(
            isFlipped
                ? (colorScheme == .dark ? Color.blue.opacity(0.2) : Color.blue.opacity(0.6))
                : (colorScheme == .dark ? Color.gray.opacity(0.2) : Color.gray.opacity(0.6))
        )
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .foregroundColor(.white)
        .shadow(radius: 5)
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var flipFromLeft: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }

    static var flipFromRight: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


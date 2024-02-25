//
//  NeumorphicButton.swift
//  RockPaperScissors
//
//  Created by Braden Ross on 2/24/24.
//

import SwiftUI

struct NeumorphicButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.largeTitle)
        }
        .buttonStyle(NeumorphicButtonStyle())

    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(15)
            .background(){
                Group {
                    if(configuration.isPressed){
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 8)
                                        .blur(radius: 4)
                                        .offset(x: -2, y: -2)
                                        .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 5, y: 5)
                            .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                    }
                }
            }
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    ZStack(){
        Color.offWhite
            .ignoresSafeArea()
        NeumorphicButton(title: "✋", action: {})
    }
}

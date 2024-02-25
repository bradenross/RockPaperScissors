//
//  NeumorphicText.swift
//  RockPaperScissors
//
//  Created by Braden Ross on 2/25/24.
//

import SwiftUI

struct NeumorphicText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.offWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 0, y: 2)
                            .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: 0, y: -2)
                                .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.clear, Color.black)))
                    )
                    
            )
    }
}

#Preview {
    ZStack(){
        Color.offWhite
            .ignoresSafeArea()
        NeumorphicText(text: "Rock, Paper, Scissors")
    }
}

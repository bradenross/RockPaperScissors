//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Braden Ross on 2/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var humanChoice: String = ""
    @State private var botChoice: String = ""
    @State private var winner: String = ""
    @State private var highStreak: Int = 0
    @State private var currentStreak: Int = 0
    
    private func setBotChoice(){
        let choiceNum = Int.random(in: 0..<3)
        
        switch choiceNum {
        case 0:
            botChoice = "👊"
            return
        case 1:
            botChoice = "✋"
            return
        case 2:
            botChoice = "✌️"
            return
        default:
            botChoice = ""
        }
    }
    
    private func compareChoices(choice: String){
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        setBotChoice()
        humanChoice = choice
        var winnerNum = 0
        
        if(choice == "👊" && botChoice == "👊"){
            winnerNum = 0
        } else if(choice == "👊" && botChoice == "✋"){
            winnerNum = -1
        } else if(choice == "👊" && botChoice == "✌️"){
            winnerNum = 1
        } else if(choice == "✋" && botChoice == "👊"){
            winnerNum = 1
        } else if(choice == "✋" && botChoice == "✋"){
            winnerNum = 0
        } else if(choice == "✋" && botChoice == "✌️"){
            winnerNum = -1
        } else if(choice == "✌️" && botChoice == "👊"){
            winnerNum = -1
        } else if(choice == "✌️" && botChoice == "✋"){
            winnerNum = 1
        } else if(choice == "✌️" && botChoice == "✌️"){
            winnerNum = 0
        }
        
        switch(winnerNum){
        case -1:
            winner = "You lose..."
            currentStreak = 0
            return
        case 0:
            winner = "Draw"
            return
        case 1:
            winner = "WINNER!!!"
            currentStreak += 1
            if(currentStreak >= highStreak){
                highStreak = currentStreak
            }
            return
        default:
            winner = ""
        }
        
    }
    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.system(size: 25, weight: .light))
                .padding(30)
            HStack(){
                VStack(){
                    Text("Win Streak:")
                        .fontWeight(.semibold)
                    Text("\(currentStreak)")
                        .fontWeight(.light)
                }
                Spacer()
                VStack(){
                    Text("High Score:")
                        .fontWeight(.semibold)
                    Text("\(highStreak)")
                        .fontWeight(.light)
                }
            }
            .padding(15)
            Spacer()
            if(winner != ""){
                Text("\(winner)")
                    .font(.system(size: 25, weight: .light))
            }
            
            HStack(){
                VStack(){
                    Text("\(humanChoice)")
                        .font(.system(size: 50))
                    Text("Your Choice")
                }
                Spacer()
                VStack(){
                    Text("\(botChoice)")
                        .font(.system(size: 50))
                    Text("Bot's Choice")
                }
            }
            .padding(30)
            Spacer()
            HStack(spacing: 15){
                NeumorphicButton(title: "👊", action: {compareChoices(choice: "👊")})
                NeumorphicButton(title: "✋", action: {compareChoices(choice: "✋")})
                NeumorphicButton(title: "✌️", action: {compareChoices(choice: "✌️")})
            }.padding(15)
            Spacer()
        }
        .padding()
        .background(
            Color.offWhite
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
}

#Preview {
    ContentView()
}

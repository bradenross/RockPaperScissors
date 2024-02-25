//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  Created by Braden Ross on 2/23/24.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack(){
                Color.offWhite
                    .ignoresSafeArea()
                ContentView()
                    .environment(\.colorScheme, .light)
                    .preferredColorScheme(.light)
            }
        }
    }
}

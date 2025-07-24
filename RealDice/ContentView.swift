//
//  ContentView.swift
//  RealDice
//
//  Created by Sedef Bozkurt on 24.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var diceNumber = 1
    
    var body: some View {
        VStack(spacing: 41) {
            Text("Real Dice")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image("dice\(diceNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: 137, height: 137)
                .shadow(radius: 11)
            
            Button(action: {
                diceNumber = Int.random(in: 1...6)
            }) {
                Text("Zar At")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(13)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

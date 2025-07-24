//
//  ContentView.swift
//  RealDice
//
//  Created by Sedef Bozkurt on 24.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var diceNumber = 1
    @State private var rotation = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var isRolling = false
    
    var body: some View {
        VStack(spacing: 41) {
            Text("")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image("dice\(diceNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: 137, height: 137)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(scale)
                .shadow(radius: 12)
                .animation(.easeOut(duration: 0.5), value: rotation)
                .animation(.easeOut(duration: 0.3), value: scale)
            
            Button(action:  rollDice) {
                Text("Zar At")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: 200)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(isRolling)
        }
        .padding()
    }
    
    func rollDice() {
        guard !isRolling else { return }
        isRolling = true
        
        withAnimation {
            rotation += 360
            scale += 0.7
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            diceNumber = Int.random(in: 1...6)
            withAnimation {
                scale = 1.0
            }
            isRolling = false
        }
    }
}

#Preview {
    ContentView()
}

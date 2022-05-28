//
//  ContentView.swift
//  MMColorize
//
//  Created by Alexander Snitko on 3.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var guess: RGB
    @State var showScore: Bool = false
//    var target = RGB.random()
    
    var body: some View {
        ZStack {
            Color.element
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorCircle(rgb: game.target, size: 200)
                if !showScore {
                    BevelText(text: "R: ??? G: ??? B: ???", width: 200, height: 48)
                } else {
                    BevelText(text: game.target.intString(), width: 200, height: 48)
                }
                ColorCircle(rgb: guess, size: 200)
                BevelText(text: guess.intString(), width: 200, height: 48)
                ColorSlider(value: $guess.red, trackColor: .red)
                ColorSlider(value: $guess.green, trackColor: .green)
                ColorSlider(value: $guess.blue, trackColor: .blue)
                Button {
                    game.check(guess: guess)
                    showScore = true
                } label: {
                    Text("Hit me!")
                }
                .buttonStyle(NeuButtonStyle(width: 327, height: 48))
                .alert(isPresented: $showScore) {
                    Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK")) {
                        game.startNewRound()
                        guess = RGB()
                    })
                }
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: RGB())
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .tint(trackColor)
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}

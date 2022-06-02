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
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.7
//    var target = RGB.random()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ColorCircle(rgb: game.target, size: proxy.size.height * circleSize)
                    if !showScore {
                        BevelText(text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    } else {
                        BevelText(text: game.target.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }
                    ColorCircle(rgb: guess, size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    Button {
                        game.check(guess: guess)
                        showScore = true
                    } label: {
                        Text("Hit me!")
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView(guess: RGB())
                .previewDevice("iPhone 11")
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

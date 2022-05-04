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
    var target = RGB.random()
    
    var body: some View {
        VStack {
            Color(rgbStruct: game.target)
            Text("R: ??? G: ??? B: ???")
                .padding()
            Color(rgbStruct: guess)
            Text("R: 204 G: 76 B: 178")
                .padding()
            Slider(value: .constant(0.5))
            Button("Hit me!") {
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: RGB(red: 0.8, green: 0.3, blue: 0.7))
    }
}

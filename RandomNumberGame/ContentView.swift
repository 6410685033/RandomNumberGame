//
//  ContentView.swift
//  RandomNumberGame
//
//  Created by Thammasat Thonggamgaew on 19/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guessNum: Double = 0.0
    @State var showResult = false
    
    var body: some View {
        VStack{
                Text("Random Number Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.primary)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    )
                
            Spacer()
            
            VStack {
                Text("Guess a number :)")
                    .font(.headline)
                Text("Round \(game.round)")
            }.padding()
            
            Text(
                String(Game.value(num: guessNum)))
                .font(.largeTitle)
            
            HStack {
                Text("0")
                Slider(value: $guessNum)
                Text("100")
            }
            
            Button("Guess") {
                showResult = true
                game.check(guess: guessNum)
            }.padding()
            .alert(isPresented: $showResult) {
                Alert(
                    title: Text("Result"),
                    message: Text(game.msg),
                    dismissButton: .default(Text("OK")) {
                        // reset guess, new game
                        if game.win {
                            guessNum = 0.0
                            game.startNewGame()
                        }
                        
                    }
                )
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


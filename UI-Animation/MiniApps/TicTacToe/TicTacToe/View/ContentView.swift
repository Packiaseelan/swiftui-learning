//
//  ContentView.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moves = ["", "", "", "", "", "", "", "", ""]
    @State private var endGameText = "TicTacToe"
    @State private var gameEnded = false
    
    @State private var botSessionScore: Int = 0
    @State private var youSessionScore: Int = 0
    
    private var ranges = [(0..<3), (3..<6), (6..<9)]
    
    var body: some View {
        VStack {
            Text(endGameText)
                .alert(endGameText, isPresented: $gameEnded) {
                    Button("Reset", role: .destructive, action: resetGame )
                }
            
            Spacer()
            
            DetailsCard(botSessionScore: botSessionScore, youSessionScore: youSessionScore)
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 10) {
                ForEach(ranges, id: \.self) { range in
                    HStack(spacing: 10) {
                        ForEach(range, id: \.self) { i in
                            XOButton(letter: $moves[i])
                                .simultaneousGesture(
                                    TapGesture()
                                        .onEnded({ _ in
                                            playerTap(index: i)
                                        })
                                )
                        }
                    }
                }
            }
            
            Spacer()
            
            Button("Reset", action: resetGame )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func playerTap(index: Int) {
        if gameEnded == false {
            
            if moves[index] == "" {
                moves[index] = "X"
                
                checkStatus()
                if !gameEnded {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: botMove)
                }
            }
        }
    }
    
    func botMove() {
        let botPossibility = botWinningPossibility(list: moves)
        if botPossibility >= 0 {
            moves[botPossibility] = "O"
        } else {
            let playerWinningPosible = playerWinningPossibility(list: moves)
            if playerWinningPosible >= 0 {
                moves[playerWinningPosible] = "O"
            } else {
                botDefaultMove()
            }
        }
        checkStatus()
    }
    
    func botDefaultMove() {
        var availableMoves: [Int] = []
        var movesLeft = 0
        // Check the available moves left
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        // Make sure there are moves left before bot moves
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
        // Logging
        print(availableMoves)
    }
    
    func checkStatus() {
        for letter in ["X", "O"] {
            if checkWinner(list: moves, letter: letter) {
                endGameText = "\(letter) has won!"
                gameEnded = true
                switch letter {
                case "X":
                    youSessionScore += 1
                case "O":
                    botSessionScore += 1
                default:
                    break
                }
                break
            }
        }
    }
    
    func resetGame() {
        moves = ["", "", "", "", "", "", "", "", ""]
        endGameText = "TicTacToe"
        gameEnded = false
    }
}

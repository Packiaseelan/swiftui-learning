//
//  ContentViewModel.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published  var moves = ["", "", "", "", "", "", "", "", ""]
    @Published var gameStatus = "TicTacToe"
    @Published var gameEnded = false
    
    @Published var botSessionScore: Int = 0
    @Published var youSessionScore: Int = 0
    
    let ranges = [(0..<3), (3..<6), (6..<9)]
    let title = "TicTacToe"
    
    func playerMove(index: Int) {
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
    
    func resetGame() {
        moves = ["", "", "", "", "", "", "", "", ""]
        gameStatus = "TicTacToe"
        gameEnded = false
    }
    
    func resetSession() {
        resetGame()
        botSessionScore = 0
        youSessionScore = 0
    }
    
    private func botDefaultMove() {
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
    
    private func checkStatus() {
        for letter in ["X", "O"] {
            if checkWinner(list: moves, letter: letter) {
                gameStatus = "\(letter) has won!"
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
}

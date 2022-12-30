//
//  Utils.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import Foundation

private let winningSequences = [
    // Horizontal rows
    [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ],
    // Diagonals
    [ 0, 4, 8 ], [ 2, 4, 6 ],
    // Vertical rows
    [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ],
]

func checkWinner(list: [String], letter: String) -> Bool {
    for sequence in winningSequences {
        var score = 0
        
        for match in sequence {
            if list[match] == letter {
                score += 1
                
                if score == 3 {
                    print("\(letter) has won!")
                    return true
                }
            }
        }
    }
    return false
}

func playerWinningPossibility(list: [String]) -> Int {
    checkWinningPossibility(list: list, letter: "X")
}

func botWinningPossibility(list: [String]) -> Int {
    checkWinningPossibility(list: list, letter: "O")
}

private func checkWinningPossibility(list: [String], letter: String) -> Int {
    var posibility = -1
    
    for sequence in winningSequences {
        var score = 0
        
        for match in sequence {
            if list[match] == letter {
                score += 1
            }
        }
        
        if score == 2 {
            for match in sequence {
                if list[match].isEmpty {
                    print("\(letter) has possibility at \(match) index")
                    posibility = match
                }
            }
        }
    }
    return posibility
}

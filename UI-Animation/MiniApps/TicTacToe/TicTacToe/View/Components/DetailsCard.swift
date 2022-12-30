//
//  DetailsCard.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct DetailsCard: View {
    let botSessionScore: Int
    let youSessionScore: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            DetailsTile(name: "YOU", letter: "X", score: youSessionScore)
            DetailsTile(name: "BOT", letter: "O", score: botSessionScore)
        }
    }
}

struct DetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCard(botSessionScore: 0, youSessionScore: 0)
    }
}

struct DetailsTile: View {
    let name: String
    let letter: String
    let score: Int
    
    var body: some View {
        HStack {
            Text("\(name):")
            Text(letter)
                .fontWeight(.bold)
            Spacer()
            Text("\(score)")
                .fontWeight(.bold)
        }
        .font(.title)
        .foregroundColor(.primary)
    }
}

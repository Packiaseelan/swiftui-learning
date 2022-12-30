//
//  DetailsCard.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct DetailsCard: View {
//    let botSessionScore: Int
//    let youSessionScore: Int
    
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            DetailsTile(name: "YOU", letter: "X")
            Divider()
            DetailsTile(name: "BOT", letter: "O")
            Divider()
            
            HStack {
                
                Text("Session Score")
                
                Spacer()
                
                VStack {
                    Text("YOU")
                    Text("\(vm.youSessionScore)")
                        .fontWeight(.bold)
                }
                Spacer()
                
                VStack {
                    Text("BOT")
                    Text("\(vm.botSessionScore)")
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button("Reset", action: vm.resetGame)
            }
        }
        .padding(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary)
        }
    }
}

struct DetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCard()
            .environmentObject(ContentViewModel())
    }
}

struct DetailsTile: View {
    let name: String
    let letter: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(letter)
                .fontWeight(.bold)
            
        }
        .padding(.horizontal)
        .font(.title)
        .foregroundColor(.primary)
    }
}

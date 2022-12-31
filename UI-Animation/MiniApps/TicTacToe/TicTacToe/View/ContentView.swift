//
//  ContentView.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        VStack {
            Text(vm.title)
                .font(.largeTitle.weight(.semibold))
                .alert(vm.gameStatus, isPresented: $vm.gameEnded) {
                    Button("Reset", role: .destructive, action: vm.resetGame )
                }
            
            Spacer()
            
            DetailsCard()
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 10) { gameGrid }
            
            Spacer()
            
            Button("Reset", action: vm.resetGame)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}

extension ContentView {
    private var gameGrid: some View {
        ForEach(vm.ranges, id: \.self) { range in
            HStack(spacing: 10) {
                ForEach(range, id: \.self) { i in
                    XOButton(letter: $vm.moves[i])
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded({ _ in
                                    vm.playerMove(index: i)
                                })
                        )
                }
            }
        }
    }
}

//
//  MultipleSheetBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 16/05/22.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

struct MultipleSheetBootcamp: View {
    
    @State var selectedModel: RandomModel?
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
            }
            
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
            }
        }
        .sheet(item: $selectedModel) { model in
            SheetView(random: model)
        }
    }
}


struct MultipleSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetBootcamp()
    }
}

struct SheetView: View {
    let random: RandomModel
    
    var body: some View {
        Text(random.title)
    }
}

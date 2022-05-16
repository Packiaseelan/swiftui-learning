//
//  ScrollViewReaderBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 15/05/22.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            textArea
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        getText(for: index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()){
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}

extension ScrollViewReaderBootcamp {
    private var textArea: some View {
        HStack {
            TextField("Enter # here...", text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .border(Color.gray)
                .keyboardType(.numberPad)
            
            
            Button("Scroll Now") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                    textFieldText = ""
                }
            }
        }
        .padding(.horizontal)
    }
    
    func getText(for index: Int) -> some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.ultraThinMaterial)
            .shadow(radius: 10)
            .padding()
            .frame(height: 200)
            .overlay {
                Text("This is item \(index)")
            }
            .id(index)
    }
}

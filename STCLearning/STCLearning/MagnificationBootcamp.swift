//
//  MagnificationBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 14/05/22.
//

import SwiftUI

struct MagnificationBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                ForEach (0..<10) { index in
                    post
                }
                
            }
        }
        
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title3)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

struct MagnificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationBootcamp()
    }
}


extension MagnificationBootcamp {
    private var header: some View {
        HStack {
            Circle()
                .frame(width: 35, height: 35)
            Text("Packaiseelan")
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal)
    }
    
    private var utils: some View {
        HStack {
            Image(systemName: "heart.fill")
            Image(systemName: "text.bubble.fill")
            Spacer()
        }
        .font(.headline)
        .padding(.horizontal)
    }
    
    private var caption: some View {
        Text("This is the caption for this post")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    
    private var post: some View {
        VStack(spacing: 10) {
            header
            PostView()
            utils
            caption
        }
    }
}


struct PostView: View {
    
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .scaleEffect(1 + currentAmount)
            .frame( height: 300)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            currentAmount = 0
                        }
                    }
            )
    }
}

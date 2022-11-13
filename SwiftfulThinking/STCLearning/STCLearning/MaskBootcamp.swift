//
//  MaskBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 16/05/22.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .mask(IntroView())
            
            stars
                .overlay(overlayView
                    .mask(stars))
        }

        
    }
    
    private var overlayView: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading, content: {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geo.size.width)
            })
        }
        .allowsHitTesting(false)
    }
    
    private var stars: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}

struct IntroView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("APPLE")
            Image(systemName: "applelogo")
        }
        .font(.system(size: 100))
    }
}

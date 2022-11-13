//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 14/07/22.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                action(value)
            }
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    @State var title: String = "New title here!!!!"
    @State var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                
                contentLayer
            }
        }
        .overlay(
            Text("\(scrollViewOffset)")
        )
        .padding()
        .navigationBarHidden(true)
        
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollViewOffsetPreferenceKeyBootcamp()
        }
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text(title)
            .opacity(Double(scrollViewOffset) / 63.0)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onScrollViewOffsetChanged { offset in
                scrollViewOffset = offset
            }
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
}

//
//  HomeView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 27/11/22.
//

import SwiftUI

struct ParallaxHomeView: View {
    @State var firstMinY: CGFloat = 0
    
    // Stopping Bounces on ScrollView
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @State var minY: CGFloat = 0
    @State var lastMinY: CGFloat = 0
    @State var scale: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            
            ScrollView(showsIndicators: false) {
                // Top Sticky View
                StickyView(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    ForEach(subTitles, id: \.self) { title in
                        Section(header: Text(title)
                                    .font(.title)
                                    .fontWeight(.bold)) {
                            Text("Tigers have an infallible memory, as their short-term memory lasts about thirty times longer than ours, and their recollection is made up of much more powerful brain synapses, which means that these felines do not forget as easily as humans.")
                        }
                    }
                })
                .padding()
                // since we are moving View up
                .padding(.bottom, lastMinY)
                .offset(y: scale > 0.4 ? minY : lastMinY)
                .opacity(scale < 0.3 ? 1 : 0)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .foregroundColor(Color("ParallaxAppTextColor"))
        .background(Color("ParallaxAppBgColor").ignoresSafeArea(.all, edges: .all))
        .navigationBarHidden(true)
    }
}

let subTitles = ["Subtitle 1", "Subtitle 2", "Subtitle 3", "SubTitle 4", "SubTitle 5"]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxHomeView()
    }
}

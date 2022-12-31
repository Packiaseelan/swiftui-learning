//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = VideoManager()
//    @State var searchQuery: String = ""
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { query in
                        QueryTag(query: query, isSelected: query == vm.selectedQuery)
                            .onTapGesture {
                                vm.selectedQuery = query
                            }
                    }
                }
                
                ScrollView {
                    if vm.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.videos, id: \.id) { video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCard(video: video)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.accentColor)
            .navigationBarHidden(true)
//            .navigationTitle("Video Finder")
//            .searchable(text: $searchQuery, placement: .sidebar, prompt: "search here...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

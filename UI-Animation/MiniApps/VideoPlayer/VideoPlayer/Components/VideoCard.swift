//
//  VideoCard.swift
//  VideoPlayer
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct VideoCard: View {
    let video: Video
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: video.image)) { image in
                    image.resizable()
                        .frame(width: 160, height: 250)
                        .cornerRadius(30)
                    
                } placeholder: {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                }
                
                VStack(alignment: .leading) {
                    Text("\(video.duration) sec")
                        .font(.caption.weight(.bold))
                    
                    Text("By \(video.user.name)")
                        .font(.caption.weight(.bold))
                }
                .padding()
                .foregroundColor(.white)
                .shadow(radius: 20)

            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(50)
        }
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(video: previewVideo)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

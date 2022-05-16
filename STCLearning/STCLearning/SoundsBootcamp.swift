//
//  SoundsBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 16/05/22.
//

import SwiftUI
import AVKit

class SoundManager: ObservableObject {
    static var instance = SoundManager()
    
    var player: AVPlayer?
    
    enum SoundOptions: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOptions) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3")  else {return}
        player = AVPlayer(url: url)
        player?.play()
    }
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}

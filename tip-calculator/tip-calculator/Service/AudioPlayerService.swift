//
//  AudioPlayerService.swift
//  tip-calculator
//
//  Created by Rahul Nimje on 27/03/23.
//

import Foundation
import AVFoundation

protocol AudioPlayerService {
    func playSound()
}

final class DefaultAudioService: AudioPlayerService {
    
    private var player: AVAudioPlayer?
    
    func playSound() {
        let path = Bundle.main.path(forResource: "click", ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}

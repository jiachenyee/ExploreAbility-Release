//
//  MonoAudioChallengeAudioViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import AVFoundation
import Combine

// Enum to represent audio channels
enum AudioChannel {
    case left
    case right
}

class MonoAudioChallengeAudioViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    
    private var audioEngine: AVAudioEngine?
    private var audioPlayers: [AudioChannel: AVAudioPlayerNode] = [:]
    
    init() {
        setupAudioEngine()
    }
    
    private func setupAudioEngine() {
        audioEngine = AVAudioEngine()
        
        // Create and attach AVAudioPlayerNode for each channel
        audioPlayers[.left] = AVAudioPlayerNode()
        audioPlayers[.right] = AVAudioPlayerNode()
        
        guard let audioEngine = audioEngine else {
            return
        }
        
        for (_, player) in audioPlayers {
            audioEngine.attach(player)
        }
        
        // Connect the player nodes to the mixer
        let mixer = AVAudioMixerNode()
        audioEngine.attach(mixer)
        
        for (_, player) in audioPlayers {
            audioEngine.connect(player, to: mixer, format: nil)
        }
        
        audioEngine.connect(mixer, to: audioEngine.outputNode, format: nil)
    }
    
    private func prepareAudioFile() -> AVAudioFile? {
        let audioFileURL = Bundle.main.url(forResource: "test", withExtension: "mp3")!
        do {
            let audioFile = try AVAudioFile(forReading: audioFileURL)
            return audioFile
        } catch {
            print("Error preparing audio file: \(error.localizedDescription)")
            return nil
        }
    }
    
    func playAudioInChannel(channel: AudioChannel) {
        guard let audioEngine = audioEngine,
              let audioPlayer = audioPlayers[channel],
              let audioFile = prepareAudioFile() else {
            return
        }
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            
            // Stop audio if currently playing
            if audioPlayer.isPlaying {
                audioPlayer.stop()
            }
            
            audioPlayer.volume = 0.5
            
            // Set the pan property based on the channel
            switch channel {
            case .left:
                audioPlayer.pan = -1.0 // Fully left
            case .right:
                audioPlayer.pan = 1.0 // Fully right
            }
            
            // Schedule and play the audio file
            audioPlayer.scheduleFile(audioFile, at: nil)
            try audioEngine.start()
            audioPlayer.play()
            
            isPlaying = true
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
            isPlaying = false
        }
    }
    
    func stopAudio() {
        for (_, player) in audioPlayers {
            if player.isPlaying {
                player.stop()
            }
        }
        
        isPlaying = false
    }
}


import Foundation
import AVFoundation


public class FreqPlayer: Identifiable {
    public var id = UUID()
    public var volume: Float = 0 {
        didSet {
            self.player?.volume = self.volume
        }
    }
    public var player : AVAudioPlayer?
    
    public init(frequency: Int) {
        if frequency > 0 {
            guard let url = Bundle.main.url(forResource: "frequency-\(frequency)", withExtension: "wav") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                player?.numberOfLoops = -1
            } catch {
                print(error)
            }
        } else {
            // frequency-1 is just for test
            guard let url = Bundle.main.url(forResource: "frequency-1", withExtension: "wav") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                player?.numberOfLoops = -1
                
                //                print("player initialized")
            } catch {
                print(error)
            }
        }
    }
    
    deinit {
        self.player?.stop()
    }
    
    public func play() {
        guard let player = self.player else { return }
        
        if player.isPlaying {
            self.player?.setVolume(self.volume, fadeDuration: 0.05)
        } else {
            self.player?.volume = 0
            self.player?.prepareToPlay()
            self.player?.play()
            self.player?.setVolume(self.volume, fadeDuration: 0.05)
        }
    }
    
    public func stop() {
        guard let player = self.player else { return }
        
        if player.isPlaying {
            self.player?.setVolume(0, fadeDuration: 0.25)
        }
    }
}

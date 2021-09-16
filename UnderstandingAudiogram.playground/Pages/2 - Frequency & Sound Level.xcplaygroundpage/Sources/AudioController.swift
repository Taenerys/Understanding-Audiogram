import Foundation
import AVFoundation

public class AudioController: ObservableObject {
    public enum State {
        case stopped
        case playing
        
        //special case
        case play(frequency: Int)
        case playTest
    }
    
    @Published public var freqPlayers: [FreqPlayer] = []
    public let testPlayer = FreqPlayer(frequency: 0)
    
    public let frequency: [Int] = [250, 500, 1000, 2000, 4000, 8000]
    
    public init() {
        self.state = .stopped
        for freq in 1...6 {
            freqPlayers.append(FreqPlayer(frequency: freq))
            
            partialVolumes.append(0)
        }
        
        self.testPlayer.volume = 1
    }
    
    public var partialVolumes: [Float] = []{
        didSet {
            partialVolumes.enumerated().map { freqPlayers[$0].volume = $1}
            self.objectWillChange.send()
        }
    }
    
    public var state: State {
        didSet {
            switch state {
            case .stopped:
                freqPlayers.forEach { $0.stop()}
                testPlayer.stop()
            case .playing:
                testPlayer.stop()
                freqPlayers.forEach { $0.play()}
            case .play(frequency: let frequency):
                testPlayer.stop()
                freqPlayers.forEach { $0.stop()}
                partialVolumes = [Float](repeating: 0, count: 6)
                partialVolumes[frequency - 1] = 1
                freqPlayers[frequency - 1].play()
            case .playTest:
                freqPlayers.forEach {$0.stop()}
                testPlayer.play()
            }
        }
    }
}

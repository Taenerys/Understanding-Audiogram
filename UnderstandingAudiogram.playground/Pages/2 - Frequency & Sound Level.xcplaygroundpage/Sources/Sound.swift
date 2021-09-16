import SwiftUI

public struct Sound: Hashable {
    public var sound: String
    public var example: String
    public var image: UIImage
    public var color: Color
    
    public init(sound: String, example: String, image: UIImage, color: Color) {
        self.sound = sound
        self.example = example
        self.image = image
        self.color = color
    }
}

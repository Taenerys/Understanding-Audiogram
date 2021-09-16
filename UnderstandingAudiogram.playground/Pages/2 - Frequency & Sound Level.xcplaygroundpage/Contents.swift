/*:
 # Frequency & Sound Level

 - important: Please remember to DISABLE **"Enable Results"** before running this page! I noticed that if we don't disable that, there would be **an error** running this page. In this case, just start over and disable **"Enable Results"**, then try again!

 Now, let's dive into *two pillars* of audiogram: **Frequency** and **Sound Level** (or **Hearing Level** - they are basically the same thing!)

 ## Frequency

 **Frequency** or **pitch** is measured in **Hertz (Hz)**. Frequencies range from **low pitch** to **high pitch** and read from left to right on the audiogram. Each **vertical line** represents a different frequency, such as 250, 500, 1000, 2000, 4000 and 8000 Hz.

 Basically, **how high a sound is**.

 Here you can find on the right is a **basic visualizer** for the frequencies.

- note: Please **tap on + or -** to switch between **different frequencies** and **play their sounds** accordingly! If you want to stop the sound, tap **Stop**. If you want to start playing again, go ahead and tap on + or - again!

 ---

 ## Sound Level

 The **sound level** is measured in **decibels (dB)**. It relates to **how loud or soft** a sound is. Each **horizontal line** represents a different intensity level. The **softest ** sounds are at the top of the chart and the **loudest** sounds at the bottom. Each mark on your audiogram shows the softest sounds you can hear. The softest intensity tested is typically 0 dB and the loudest is 120 dB.

 Basically, **how loud a sound is.**

 - note: Below the frequency visualizer, I made a few flashcards for **some common sound levels and their real world examples**. **Have fun tapping it and learn**! If you run the Playground on **Mac** the tapping can feel **a little laggy**. I would recommend trying to **run it again** and **stop the frequency visualizer** first!

 (**Pro tip**: it looks pretty satisfying if you tap on the cards in order - it would like a beautiful rainbow wave 🌈❤️)

 Now tap **Next** to check out an actual audiogram!
 
 ---
 
 [Previous](@previous)     [Next](@next)
 */
//#-hidden-code
import SwiftUI
import PlaygroundSupport

public struct FrequencyView: View {
    
    @ObservedObject public var audioController: AudioController
    
    @State var frequency: Int = 1 
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack {
                Stepper("\(audioController.frequency[frequency - 1]) Hz", value: $frequency, in: 1...6, onEditingChanged: { isChanging in
                            if !isChanging {
                                self.audioController.state = .play(frequency: self.frequency)
                            }})
                    .frame(width: 220)

                Text("Tap on + or - to listen to the sound!").bold()
            }
            .padding(50)
            
            FrequencyGraph(audioController: self.audioController)
                .disabled(true)
                .padding(20)
            
            Button(action: {
                self.audioController.state = .stopped
            }) {
                StopButton()
            }
            .padding(50)
        }
    }
    
    init() {
        audioController = AudioController()
        audioController.partialVolumes = [1, 0, 0, 0, 0, 0]
        audioController.state = .stopped
    }
}

public struct SoundLevelView: View {
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    public var soundData: [Sound] = [
        Sound(sound: "0 dB", example: "Quitest sound!", image: #imageLiteral(resourceName: "intro-memoji.png"), color: .gray),
        Sound(sound: "30 dB", example: "Whispering", image: #imageLiteral(resourceName: "whisper.jpg"), color: .yellow),
        Sound(sound: "60 dB", example: "Normal Talking", image: #imageLiteral(resourceName: "conversation.jpg"), color: .orange ),
        Sound(sound: "90 dB", example: "City Traffic", image: #imageLiteral(resourceName: "city-traffic.jpg"), color: .green),
        Sound(sound: "110 dB", example: "Loud Thunder", image: #imageLiteral(resourceName: "thunder.jpg"), color: .red),
        Sound(sound: "120 dB", example: "Rock Band", image: #imageLiteral(resourceName: "rock-band.jpg"), color: .blue),
        Sound(sound: "140 dB", example: "Jet Plane", image: #imageLiteral(resourceName: "jet-plane.jpg"), color: .purple),
        Sound(sound: "180 dB", example: "Rocket Launch!", image: #imageLiteral(resourceName: "rocket.jpg"), color: .pink)
        
    ]
    
    public var body: some View {
        LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 5) {
            ForEach(soundData.indices) { index in 
                CardView(front: {
                    Text(soundData[index].sound).bold()
                }, back: {
                    VStack {
                        Image(uiImage: soundData[index].image)
                            .resizable()
                            .scaledToFit()
                        Text(soundData[index].example).font(.caption)
                    }
                }, color: soundData[index].color )
            }
            
        }
        
    }
}
//#-hidden-code

public struct Everything: View {
    public var body: some View {
        VStack (spacing: 20) {
            FrequencyView()
            SoundLevelView()
        }
    }
}

PlaygroundPage.current.setLiveView(Everything())

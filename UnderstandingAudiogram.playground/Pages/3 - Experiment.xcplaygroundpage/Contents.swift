/*:
 # Experiment
 
 - important: Please DISABLE **"Enable Results"** before running this page!

 Let's **experiment** on a **real audiogram**!

 > **Fun fact**: I did not want to use actual audiograms due to them **not being public domain** and can be a sensitive medical information, so I went ahead and **made my own audiograms**! With **Python's Matplotlib library**, it is surprisingly easy!


 The Pure Tone Average (PTA) refers to **the average of hearing threshold levels** at a **set of specified frequencies**: typically **500, 1000, 2000 and 4000 Hz**. We don't count other outlying frequencies so as to make the average seem more well spread out!

 - note: Tap on **"Run My Code"** to **see the audiogram I made**! Can you work out the **sound level ** numbers for **500 Hz, 1000 Hz, 2000 Hz and 4000 Hz** for the audiogram on the right?

 I got you! 💪
 */

//: **Enter the thresholds for 500Hz:**
let leftData = [10, /*#-editable-code dB value for 500Hz*/30/*#-end-editable-code*/, 50, 50, 65]
let rightData = [12, /*#-editable-code dB value for 500Hz*/20/*#-end-editable-code*/, 40, 40, 70]

PlaygroundPage.current.setLiveView(ExperimentView(leftData: leftData, rightData: rightData))

/*:

 - note: Now tap on the **Calculate Average button** to see the PTA for each ear!

 So what does PTA mean for us here? This value gives **a snapshot of an individual’s hearing level** in each ear. 👁️👄👁️

 Here are **different types of hearing loss** with **accompanied PTA ranges**:
 
 - Example:
**Mild hearing loss**: 25 to 40 dB
 \
 \
**Moderate hearing loss**: 40 to 55 dB
 \
 \
**Moderate-to-severe hearing loss**: 55 to 70 dB
 \
 \
**Severe hearing loss**: 70 to 90 dB
 \
 \
**Profound hearing loss**: 90 dB or more
 

 
 - note: Can you see now with these current PTAs, what is the **degree of hearing loss** for each ear? Tap on **Degree of Hearing Loss button** to find out! 🦻

 You got it! 🎉🎉 These are the very **basic information** of a typical audiogram that you can work out on your own. 🙌 Now let's tap **Next** to explore the **next steps**!
 
 - note: All the pictures used comes from the website [unsplash.com](https://unsplash.com/) - which provides *free*, public domain pictures!

 ---
 
 [Previous](@previous)     [Next](@next)
 
 */


//#-hidden-code
import SwiftUI
import PlaygroundSupport

public struct ExperimentView: View {
    var leftData: [Int]
    var rightData: [Int]
    @State var calculated: Bool = false
    @State var presentEstimation: Bool = false
    @State var degreeShown: Bool = false
    
    @State var averageLeftEar: Double = 0.0
    @State var averageRightEar: Double = 0.0
    
    @State var resultLeftEar: String = ""
    @State var resultRightEar: String = ""
    
    public var body: some View {
        VStack (alignment: .center, spacing: 16) {
            Image(uiImage: #imageLiteral(resourceName: "Audiogram.png"))
                .resizable()
                .frame(width: 500, height: 500, alignment: .center)
                .scaledToFit()
            Button(action: {
                self.getAverageTone()
            }) {
                Text("Calculate Average").bold()
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                    .foregroundColor(.blue)
            }
            
            Button(action: {
                resultLeftEar = self.getHearingLossEstimation(average: self.averageLeftEar)
                resultRightEar = self.getHearingLossEstimation(average: self.averageRightEar)
                self.degreeShown.toggle()
            }) {
                Text("Degree of Hearing Loss").bold()
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                    .foregroundColor(.red)
            }
            
            if self.calculated {
                HStack (spacing: 40) {
                    HStack {
                        Label("Left", systemImage: "hearingaid.ear")
                            .font(.headline)
                        Text("\(averageLeftEar.removeZerosFromEnd()) dB").bold()
                    }
                    
                    HStack {
                        Label("Right", systemImage: "hearingaid.ear")
                            .font(.headline)
                        Text("\(averageRightEar.removeZerosFromEnd()) dB").bold()
                    }
                    
                }
            }
            
            if self.degreeShown {
                Text("The degree of hearing loss for left ear is \(self.resultLeftEar) and right ear is \(self.resultRightEar)!").bold()
            }
            
        }
//          .sheet(isPresented: $isPresented, content: {
//              HearingLossInfo()
//          })
    }
    
    //Add up the threshold levels for 500 Hz, 1000 Hz, 2000 Hz, and 4000 Hz for the right ear, then divide them by four
    
    private func getAverageTone() {
        let sumOfLeft = self.leftData.reduce(0, +)
        let sumOfRight = self.rightData.reduce(0, +)
        
        self.averageLeftEar = Double(sumOfLeft) / Double(self.leftData.count)
        self.averageRightEar = Double(sumOfRight) / Double(self.rightData.count)
        
        self.calculated = true
    }
    
    private func getHearingLossEstimation(average: Double) -> String {
        var result: String = ""
        
        switch average {
        case -10...20:
            result = "normal"
        case 20...40:
            result = "mild"
        case 40...55:
            result = "moderate"
        case 55...70:
            result = "moderately severe"
        case 70...90:
            result = "severe"
        default:
            result = "profound"
        }
        return result
    }
}


// A bit too ugly on Mac
struct HearingLossInfo: View {
    public var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "Audiogram.png"))
                .resizable()
                .scaledToFit()
            Text("Mild hearing loss: 25 to 40 dB higher than normal")
            Text("Moderate hearing loss: 40 to 55 dB higher than normal")
            Text("Moderate-to-severe hearing loss: 55 to 70 dB higher than normal")
            Text("Severe hearing loss: 70 to 90 dB higher than normal")
            Text("Profound loss: 90 dB or more")
        }
    }
}
//#-hidden-code






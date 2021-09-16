import SwiftUI

public struct CardView<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    var color: Color
    
    @State var flipped: Bool = false
    @State var cardRotation = 0.0
    @State var contentRotation = 0.0
    
    public init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back, color: Color) {
        self.front = front
        self.back = back
        self.color = color
    }
    
    public var body: some View {
        ZStack {
            if flipped {
                back()
            } else {
                front()
            } 
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .padding()
        .foregroundColor(Color(.black))
        .frame(width: 150, height: 150)
        .background(color)
        .cornerRadius(22)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.black, lineWidth: 2)
                .shadow(color: Color(.gray).opacity(0.2), radius: 20, x: 0, y: 2)
        )
        .padding()
        .onTapGesture {
            flipCard()
        }
        .rotation3DEffect(.degrees(cardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipCard() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            cardRotation += 180
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
}

import PencilKit
import PlaygroundSupport
import SwiftUI

public struct DrawingQuestion: View {
    
    var question: Question
    
    @State var answered: Bool = false
    @State var correct: Bool = false
    
    @State public var canvasView: PKCanvasView
    
    public init(question: Question) {
        self.question = question
        self._canvasView = State(initialValue: PKCanvasView())
    }
    
    public var body: some View {
        VStack {
            HStack {
                ZStack {
                    VStack {
                        Text(self.question.question)
                            .foregroundColor(Color.black)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .padding(10)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 140)
                    .background(RoundedRectangle(cornerRadius: 22).fill(Color.white).shadow(color: Color(.gray).opacity(0.2), radius: 20, x: 0, y: 2))
                    .rotation3DEffect(.degrees(self.answered ? 180.0 : 0.0), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .opacity(self.answered ? 0.0 : 1.0)
                    .zIndex(0)
                    .animation(.easeInOut(duration: 0.55))
                    
                    VStack {
                        Text(self.correct ? "Your answer is correct!" : "Your answer is wrong!")
                            .foregroundColor(Color.black)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .padding(30)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .background(RoundedRectangle(cornerRadius: 22).fill(Color.white).shadow(color: Color(.gray).opacity(0.2), radius: 20, x: 0, y: 2))
                    .rotation3DEffect(.degrees(self.answered ? 0.0 : 180.0), axis: (x: 0.0, y: -1.0, z: 0.0))
                    .opacity(self.answered ? 1.0 : 0.0)
                    .zIndex(1)
                    .animation(.easeInOut(duration: 0.55))
                    
                }
                .animation(.easeInOut(duration: 0.55))
            }
            .padding()
            HStack {
                VStack {
                    CanvasView(canvasView: self.$canvasView)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(self.getStrokeColor(), lineWidth: 8))
                    Text("Draw the symbol in the box and press Submit when you're done!")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, design: .default))
//                       .foregroundColor(Color.gray)#fileLiteral(resourceName: "1__#$!@%!#__Symbols 2.mlmodelc")
                        .multilineTextAlignment(.leading)
                }
                
            }
            .padding()
            HStack {
                Button("Clear") {
                    self.canvasView.drawing = PKDrawing()
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                
                Spacer()
                    .frame(maxWidth: 20)
                
                Button("Submit") {
                    self.submitAnswer()
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            }
            .padding()
        }
        
        
    }
    
    func preprocessImage(canvasView: PKCanvasView) -> UIImage{
        let image = self.canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 10.0)
        return image
    }
    
    func predictInput(canvasView: PKCanvasView) -> String? {
        let image = self.preprocessImage(canvasView: canvasView)
        let trainedImageSize = CGSize(width: 45, height: 45)
        if let resizedImage = image.fit(in: trainedImageSize, background: .white), let pixelBuffer = resizedImage.toCVPixelBuffer() {
            guard let result = try? Symbols_2().prediction(image: pixelBuffer) else {
                return nil
            }
            return result.classLabel
        }
        return nil
    }
    
    func submitAnswer() {
        let answer = self.predictInput(canvasView: self.canvasView)
        if (answer != nil) {
            if (answer == self.question.correctAnswer) {
                self.correct = true
            }
            self.answered = true
        }
    }
    
    func getStrokeColor() -> Color {
        if (self.answered) {
            if (self.correct) {
                return Color(red: 0.77, green: 0.96, blue: 0.83)
            } else {
                return Color(red: 1, green: 0.84, blue: 0.84)
            }
        }
        return Color.gray
    }
    
    
}


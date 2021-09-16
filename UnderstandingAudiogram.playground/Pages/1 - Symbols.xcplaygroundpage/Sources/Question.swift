import Foundation

public class Question {
    public var question: String
    public var correctAnswer: String
    public var wrongAnswers: [String] = []
    
    public var allAnswers: [String]
    
    public init(question: String, correctAnswer: String, wrongAnswers: [String] = []) {
        self.question = question
        self.correctAnswer = correctAnswer
        
        self.allAnswers = self.wrongAnswers
        self.allAnswers.append(correctAnswer)
        self.allAnswers.shuffle()
    }
}



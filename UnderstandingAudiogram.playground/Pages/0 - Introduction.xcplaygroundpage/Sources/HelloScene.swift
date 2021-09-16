import SpriteKit
import UIKit

public class HelloScene: SKScene {
    let helloLabel = SKLabelNode(fontNamed: "Marker Felt")
    //      let profileImage = SKSpriteNode(imageNamed: #imageLiteral(resourceName: "intro-memoji.png"))
    let profileImage = SKSpriteNode(imageNamed: "intro-memoji.png")
    let firstMessage =  SKLabelNode()
    let seeStoryOverviewNode = SKLabelNode(fontNamed: "Marker Felt")
    var storyParts = [SKLabelNode]()
    
    let storyPartOne = SKLabelNode()
    let storyPartTwo = SKLabelNode()
    let storyPartThree = SKLabelNode()
    let storyPartFour = SKLabelNode()
    let storyPartFive = SKLabelNode()
    
    override public init() {
        super.init(size: CGSize.zero)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.scaleMode = .resizeFill
        self.backgroundColor = #colorLiteral(red: 0.8862747550010681, green: 0.5725491642951965, blue: 0.9960786700248718, alpha: 1.0)
        
        profileImage.size = CGSize(width: 150, height: 150)
        profileImage.position.y = 150
        profileImage.isHidden = false
        addChild(profileImage)
        
        helloLabel.text = "Hello!"
        helloLabel.fontSize = 50
        helloLabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        helloLabel.horizontalAlignmentMode = .center
        helloLabel.preferredMaxLayoutWidth = 300
        helloLabel.numberOfLines = 1
        helloLabel.position.y = 10
        addChild(helloLabel)
        
        seeStoryOverviewNode.text = "Tap here to start!"
        seeStoryOverviewNode.fontSize = 25
        seeStoryOverviewNode.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        seeStoryOverviewNode.horizontalAlignmentMode = .center
        seeStoryOverviewNode.preferredMaxLayoutWidth = 500
        seeStoryOverviewNode.numberOfLines = 1
        seeStoryOverviewNode.position.y = -100
        addChild(seeStoryOverviewNode)
        
        storyPartOne.text = "My name is Anh 💃. In this Swift Playground I would love to teach you how to understand basic audiograms!"
        storyParts.append(storyPartOne)
        
        storyPartTwo.text = "First you will learn how to recognize some of the most common symbols in an audiogram 🤩!"
        storyParts.append(storyPartTwo)
        
        storyPartThree.text = "Second, you will learn about two pillars of an audiogram - Frequency and Hearing Level 🥳!"
        storyParts.append(storyPartThree)
        
        storyPartFour.text = "Finally, you will look at an actual audiogram example with me! Our hearing is so precious, I sincerely hope I could help you in some ways in understanding yours ❤️!"
        storyParts.append(storyPartFour)
        
        storyPartFive.text = "Let's go! 🙌🏻 Tap on the next page to start!"
        storyParts.append(storyPartFive)
        
        for part in storyParts {
            let attrString = NSMutableAttributedString(string: part.text!)
            let paragraphStyle = NSMutableParagraphStyle()
            let range = NSRange(location: 0, length: part.text!.count)
            
            paragraphStyle.alignment = .center
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range)
            attrString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Marker Felt", size: 30)!, range: range)
            
            part.horizontalAlignmentMode = .center
            part.preferredMaxLayoutWidth = 500
            part.numberOfLines = 5
            part.position.y = -185
            part.isHidden = true
            part.attributedText = attrString
            addChild(part)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if seeStoryOverviewNode.contains(location) {
                seeStoryOverviewNode.isHidden = true
                presentStory()
            }
        }
    }
    
    func presentStory() {
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        
        self.storyPartOne.run(fadeOut, completion: {() -> Void in
            self.storyPartOne.isHidden = false
            self.storyPartOne.run(fadeIn, completion: {() -> Void in
                sleep(5)
                self.storyPartOne.run(fadeOut, completion: {() -> Void in
                    self.storyPartOne.isHidden = true
                    self.storyPartTwo.run(fadeOut, completion: {() -> Void in
                        self.storyPartTwo.isHidden = false
                        self.storyPartTwo.run(fadeIn, completion: {() -> Void in
                            sleep(5)
                            self.storyPartTwo.run(fadeOut, completion: {() -> Void in
                                self.storyPartTwo.isHidden = true
                                self.storyPartThree.run(fadeOut, completion: {() -> Void in
                                    self.storyPartThree.isHidden = false
                                    self.storyPartThree.run(fadeIn, completion: {() -> Void in
                                        sleep(5)
                                        self.storyPartThree.run(fadeOut, completion: {() -> Void in
                                            self.storyPartThree.isHidden = true
                                            self.storyPartFour.run(fadeOut, completion: {() -> Void in
                                                self.storyPartFour.isHidden = false
                                                self.storyPartFour.run(fadeIn, completion: {() -> Void in
                                                    sleep(5)
                                                    self.storyPartFour.run(fadeOut, completion: {() -> Void in
                                                        self.storyPartFour.isHidden = true
                                                        self.storyPartFive.run(fadeOut, completion: {() -> Void in
                                                            self.storyPartFive.isHidden = false
                                                            self.storyPartFive.run(fadeIn, completion: {() -> Void in 
                                                                sleep(5)
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
}

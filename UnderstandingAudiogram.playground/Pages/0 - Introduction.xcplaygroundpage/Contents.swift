/*:
 # Hearing is Fundamental

 Get it?? Get it? I just referenced RuPaul Drag Race's iconic "Reading is Fundamental" challenge - I've always wanted to reference that show for once since I became obsessed with it! *(hug you a ton if you get this reference!)* But I digress, many apologies!

 Anyway, this is a playground book I dedicated to myself and the Deaf community! I struggled a lot with my Deafness growing up, but now I could embrace this part of my identity so proudly and wholeheartedly, and stand in solidarity with my community. 😊

## Did you know?

 - important: Globally, over 430 million people experience disabling hearing loss, a number that could grow to nearly 700 million by 2050. (Source: [WHO](https://www.who.int/news-room/events/detail/2021/03/03/default-calendar/launch-of-the-world-report-on-hearing))

 And World Hearing Day is March 2nd which has just passed! The [theme for this year](https://www.who.int/campaigns/world-hearing-day/2021) is:

- note: Hearing Care for ALL! Screen, Rehabilitate, Communicate
 
 
 
 ## Motivation

 I created what I wish my younger self could read, when she was frustrated at how complicated her audiogram looked after getting home from the audiologist's office.
 
 - important: Audiogram is a chart that shows the results of a hearing test.
 
 
 This book is in no way intended to replace the actual guide for interpreting audiograms, but rather hopefully a tiny guide for anyone who wishes to understand their hearing test results on their own! I truly believe when you understand your audiogram, you understand and appreciate your hearing health much better. Our hearing is so precious, and deserves our full attention and care. With this Playground book, I hope I can inspire people to educate themselves more on this subject and realize their full potential, as I continue to do so for myself.

 Now I shall let you get on this journey!
 
 
 
 ## Let's get going!
 
 - important: For a tiny humble introduction, please tap **"Run My Code"** for this page! Again, please remember to disable Enable Results for EVERY page, as it will guarantee the best performance for this Playground ❤️ And enjoy!
 
 */

import SwiftUI
import SpriteKit
import PlaygroundSupport

struct IntroView: View {
    var scene: SKScene {
        let scene = HelloScene()
        scene.size = CGSize(width: 500, height: 500)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 500, height: 500, alignment: .center)
    }
}


PlaygroundPage.current.setLiveView(IntroView())

/*:

 When you're done, tap **Next** to learn about the mighty *audiogram symbols*!
 
 ---
[Next](@next)
 
 
 */

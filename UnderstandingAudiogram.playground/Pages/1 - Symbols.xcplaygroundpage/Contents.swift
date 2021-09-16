/*:
 
 # Audiogram Symbols
 
 - important: Please remember to DISABLE **"Enable Results"** before running this page! I noticed that if we don't disable that, there would be **an error** running this page. In this case, just start over and disable **"Enable Results"**, then try again!

 Here we will learn all about **some of the most common symbols** in audiograms.

 Symbols are meant to tell us **which ear** have been tested (right ear or left ear) and **which type of hearing test** have been used (air conduction or bone conduction).

 - note: **Air conduction test** is the test in which audiologists will give you **earphones or loud speakers** to wear. The sound will travel **from outer to middle ear and reach inner ear,** just like how air "travels". 🍃



 - note: **Bone conduction test** is the test in which they will give you a device called **a bone vibrator** to place behind the ear where your bone is. The sound will travel **straight to inner ear.** 🏹



 The difference between these types of test are to test which **type of hearing loss** you have! Air tests **conductive hearing loss** (which can be corrected by medical methods), while bone test **sensorineural hearing loss** (most of the time cannot be corrected, is one of the main causes for **Deafness**).

 For simplicity, I will walk you through four **basic symbols**.

 The most common symbols we can find are **X** (left ear - air conduction) and **O** (right ear - air conduction).

 - AIR - LEFT EAR: **X**
 - AIR - RIGHT EAR: **O**

 The other two symbols for **bone** are **>** (left ear) and **<** (right ear).

 - BONE - LEFT EAR: **>**
 - BONE - RIGHT EAR: **<**

 - note: OK! So for a little quiz, I challenge you to try **drawing the symbols** on the right side of this page! Tap **Run My Code** to start! 💪
 1. **Draw** the symbols on the Canvas
 2. Tap on **Submit** when you are done! See if your drawing is correct or not!
 3. If you want to clear the drawing and try again **before submitting**, tap **Clear**!
 
 Also if you are stuck, absolutely feel free to reference the **HINTS** above! Also, you can only submit **once**! Do **move on to the next question** even if you get it wrong! 🙏🏻🙏🏻

 ---
 */

import SwiftUI
import PlaygroundSupport

let question1 = Question(question: "What is air left ear symbol?", correctAnswer: "air-left")

let question2 = Question(question: "What is air right ear symbol?", correctAnswer: "air-right")

let question3 = Question(question: "What is bone left ear symbol?", correctAnswer: "bone-right")

let question4 = Question(question: "What is bone right ear symbol?", correctAnswer: "bone-right")

PlaygroundPage.current.setLiveView(PencilQuizView(questions: [question1, question2, question3, question4]))

/*:
 ---
 
When you finish **these four questions**, let's tap **Next** to find out the two pillars of an audiogram - **Frequency** and **Sound Level**!
 
 ---
 
 [Previous](@previous)      [Next](@next)
 */


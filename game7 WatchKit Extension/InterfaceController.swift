//
//  InterfaceController.swift
//  game7 WatchKit Extension
//
//  Created by LILI on 03.05.2018.
//  Copyright © 2018 LILI. All rights reserved.
//

import WatchKit
import Foundation

struct QuizTemplate {
    var question = String ()
    var answer = Int ()
    var answers = [String]()
    
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!

    @IBOutlet var btn1: WKInterfaceButton!
    @IBOutlet var btn2: WKInterfaceButton!
    @IBOutlet var btn3: WKInterfaceButton!
    @IBOutlet var btn4: WKInterfaceButton!
    
    var quizObject = [QuizTemplate] ()
    var realAnswer = Int()
    var currentAnswer = Int()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
         quizObject = [QuizTemplate(question: "What is the official language in Great Britain?", answer: 2, answers: ["Russian", "Chinese", "English", "French" ]),
                          QuizTemplate(question: " In what country do men wear skirts?", answer: 1, answers: ["France ", "Scotland", "England","Norway" ]),
                          QuizTemplate(question: " Westminster Abbey is …", answer: 4, answers: ["  the chapel", "the monastery", "the inn", "the famous Royal Church" ]),]
        randomPick()
    }
    
    func randomPick() {
        let random = Int(arc4random() % UInt32(quizObject.count))
    
         label.setText(quizObject[random].question)
         btn1.setTitle(quizObject[random].answers[0])
         btn2.setTitle(quizObject[random].answers[1])
         btn3.setTitle(quizObject[random].answers[2])
         btn4.setTitle(quizObject[random].answers[3])
        
        realAnswer = quizObject[random].answer
    }
    func RightWarning()  {
        if (currentAnswer == realAnswer) {
            randomPick()
        } else {
           label.setTextColor(UIColor.blue)
        }
          }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func btn1Action() {
        currentAnswer = 0
        RightWarning ()
    }
    @IBAction func btn2Action() {
        currentAnswer = 1
        RightWarning ()
    }
    @IBAction func btn3Action() {
        currentAnswer = 2
        RightWarning ()
    }
    
    @IBAction func btn4Action() {
        currentAnswer = 3
        RightWarning ()
    }
    
}

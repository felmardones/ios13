//
//  QuestionController.swift
//  Quizzler-iOS13
//
//  Created by Felipe on 21-01-20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct QuestionController{
    var currentQuestionIndex = 0
    var questions =  [
               Questions(q: "A slug's blood is green.", a: "True"),
               Questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
               Questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
               Questions(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
               Questions(q: "Google was originally called 'Backrub'.", a: "True"),
               Questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
               Questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
               Questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
               Questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
           ]
    
    public func getQuestionText() -> String{
        return questions[currentQuestionIndex].text
    }
    mutating func nextQuestion(){
       
        if currentQuestionIndex + 1 < questions.count{
            currentQuestionIndex    += 1
        }else{
            currentQuestionIndex    = 0
        }
    }
    
    func totalQuestions() -> Int{
        return questions.count
    }
    
    func progress() -> Float{
        print(Float(currentQuestionIndex)  / Float(totalQuestions()))
        return  Float(currentQuestionIndex + 1) / Float(questions.count)
    }
    
    func getAnswer() -> String{
        return questions[currentQuestionIndex].answer
    }
    
}

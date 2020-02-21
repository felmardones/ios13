//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questions    = QuestionController(currentQuestionIndex: 0)
    var scoreNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        falseButton.layer.cornerRadius = 24
        falseButton.layer.borderWidth  = 4
        falseButton.layer.borderColor  = UIColor(red: 93.0/255.0, green: 109.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
        trueButton.layer.cornerRadius = 24
        trueButton.layer.borderWidth  = 4
        trueButton.layer.borderColor  = UIColor(red: 93.0/255.0, green: 109.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        let snapshot = questionText.snapshotView(afterScreenUpdates: true)!
        stackView.addSubview(snapshot)
        snapshot.frame = questionText.frame
        questionText.alpha = 0
        
        if checkAnswer(answer: sender.currentTitle!){
            sender.layer.backgroundColor = UIColor.systemGreen.cgColor
        }else{
            sender.clipsToBounds    = true
            sender.layer.backgroundColor = UIColor.systemRed.cgColor

        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.45) {
                self.questionText.transform = CGAffineTransform(scaleX: 0.01, y: self.questionText.frame.origin.y)
                snapshot.transform = self.questionText.transform
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.1) {
                self.questionText.alpha = 1.0
                snapshot.alpha = 0.0
                self.questions.nextQuestion()
                self.updateQuestion()
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
                self.questionText.transform = CGAffineTransform.identity
            }
        }) { _ in
            snapshot.removeFromSuperview()
        }
        
    }
    
    func checkAnswer(answer: String) -> Bool{
        
        if answer == questions.getAnswer(){
//            let newScore = scoreNum + 1
//            score.text = "\(newScore)"
            return true
        }else{
            return false
        }
        
    }
    func updateQuestion(){
        questionText.text = questions.getQuestionText()
        progressView.setProgress(questions.progress(), animated: true)
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreNum = 0
    }
}


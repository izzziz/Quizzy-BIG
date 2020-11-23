//
//  ViewController.swift
//  Quizzy
//
//  Created by Izzat Jabali on 3/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var ChoiceB: UIButton!
    @IBOutlet weak var ChoiceC: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choiceA.setTitle(answerChoices[0], for: .normal)
        ChoiceB.setTitle(answerChoices[1], for: .normal)
        ChoiceC.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choiceA.backgroundColor = UIColor.clear
        ChoiceB.backgroundColor = UIColor.clear
        ChoiceC.backgroundColor = UIColor.clear
        
    }
    
}


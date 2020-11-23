//
//  QuizBrain.swift
//  Quizzy
//
//  Created by Izzat Jabali on 3/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "What time of morning did Biggie die?", a: ["1:15am", "1:00am", "2:00am"], correctAnswer: "1:15am"),
        Question(q: "How did Biggie die?", a: ["Stabbed", "Shot", "In his sleep"], correctAnswer: "Shot"),
        Question(q: "Where is Biggie from?", a: ["Harlem", "Brooklyn", "Manhattan"], correctAnswer: "Brooklyn"),
        Question(q: "What was Biggie's real name?", a: ["Christopher Wallace", "Notorious", "Biggie Smalls"], correctAnswer: "Christopher Wallace"),
        Question(q: "What song started playing at his funeral?", a: ["Juicy", "Hypnotize", "Big Poppa"], correctAnswer: "Hypnotize"),
        Question(q: "Finish the lyric 'Biggie Biggie Biggie, can't you see? Sometimes your words just ______' What are the two words?", a: ["Scratch Myback", "Hit me", "Hypnotize Me"], correctAnswer: "Hypnotize Me"),
        Question(q: "Who was Biggie's long time friend turned 'rival'?", a: ["Puffy", "Snoop", "2pac"], correctAnswer: "Rum"),
        Question(q: "Who was Biggie NOT romantically involved with?", a: ["Mary J Blige", "Faith Evans", "Lil Kim"], correctAnswer: "Mary J Blige"),
        Question(q: "Who was Biggies wife?", a: ["Mary J Blige", "Faith Evans", "Lil Kim"], correctAnswer: "Faith Evans"),
        Question(q: "Who discovered BIG? ?", a: ["Faith", "2pac", "Puffy"], correctAnswer: "Puffy")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score 
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}


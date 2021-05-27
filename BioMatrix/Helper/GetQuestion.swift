//File GetQuestion.swift in Project BioMatrix: Created by Eesha Jain on 5/23/21

import Foundation

var question = LocalStorage.questionsValue[0]
var set = false

func getQuestion() -> Question {
    if (set) {
        return question
    }
    
    let list = LocalStorage.questionsValue
    let randomInt = Int.random(in: 0..<list.count)
    question = list[randomInt]
    set = true
    
    return question
}

func resetSet() {
    set = false
}

func newQuestion() -> Question {
    resetSet()
    return getQuestion()
}

func blankQuestion() -> Question {
    return Question(category: "", question: "", answer: "")
}

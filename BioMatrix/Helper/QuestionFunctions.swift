//File QuestionFunctions.swift in Project BioMatrix: Created by Eesha Jain on 5/23/21

import Foundation

func getQuestion() -> Question {
    if (LocalStorage.currentQuestion.set) {
        return LocalStorage.currentQuestion.question
    }
    
    let list = LocalStorage.questionsValue
    let randomInt = Int.random(in: 0..<list.count)
    LocalStorage.currentQuestion.question = list[randomInt]
    LocalStorage.currentQuestion.position = randomInt
    LocalStorage.currentQuestion.set = true
    
    return LocalStorage.currentQuestion.question
}

func newQuestion() -> Question {
    LocalStorage.currentQuestion.set = false
    return getQuestion()
}

func blankQuestion() -> Question {
    return Question(category: "", question: "", answer: [""])
}

//File GetQuestion.swift in Project BioMatrix: Created by Eesha Jain on 5/23/21

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

func changeStarred() {
    var qv = LocalStorage.questionsValue
    qv[LocalStorage.currentQuestion.position].starred = !qv[LocalStorage.currentQuestion.position].starred
    LocalStorage.questionsValue = qv
    LocalStorage.currentQuestion.question = LocalStorage.questionsValue[LocalStorage.currentQuestion.position]
}

func resetSet() {
    LocalStorage.currentQuestion.set = false
}

func newQuestion() -> Question {
    /*if (LocalStorage.questionsValue.count == 0) {
        LocalStorage.importDefaultQuestions()
    }*/
    
    resetSet()
    return getQuestion()
}

func blankQuestion() -> Question {
    return Question(category: "", question: "", answer: "")
}

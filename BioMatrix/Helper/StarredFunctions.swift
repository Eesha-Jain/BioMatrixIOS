//File StarredFunctions.swift in Project BioMatrix: Created by Eesha Jain on 6/1/21

import Foundation

func getStarredQuestions() -> [Question] {
    var list: [Question] = []
    for q in LocalStorage.questionsValue {
        if (q.starred) {
            list.append(q)
        }
    }
    
    return list
}

func changeStarredPage(q: Question) {
    var index: Int = 0;
    for question in LocalStorage.questionsValue {
        if (question.id == q.id) {
            break
        } else {
            index += 1;
        }
    }
    
    LocalStorage.questionsValue[index].starred = !LocalStorage.questionsValue[index].starred
}

func changeStarred() {
    var qv = LocalStorage.questionsValue
    qv[LocalStorage.currentQuestion.position].starred = !qv[LocalStorage.currentQuestion.position].starred
    LocalStorage.questionsValue = qv
    LocalStorage.currentQuestion.question = LocalStorage.questionsValue[LocalStorage.currentQuestion.position]
}

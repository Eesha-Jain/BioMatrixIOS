//File ImportQs.swift in Project BioMatrix: Created by Eesha Jain on 6/4/21

import Foundation

func importDefaultQuestions() -> [Question] {
    let arr = readCSV()
    var list: [Question] = []
    
    for quest in arr {
        let question = Question(category: quest[0], question: quest[1], answer: quest[2])
        list.append(question)
    }
    
    return list
}

func readCSV() -> [[String]] {
    if let url = Bundle.main.url(forResource: "biology_questions", withExtension: "csv") {
        do {
            var savedData = try String(contentsOf: url)
            savedData = savedData.replacingOccurrences(of: "\r\n", with: "-")
            let parsed = savedData.split(separator: "-")
            var answer = [[String]]()
            
            for c in parsed {
                answer.append(c.components(separatedBy: ","))
            }
            
            return answer
        } catch {
            return []
        }
    }
    
    return []
}

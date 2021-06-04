//
//  LocalStorage.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 5/18/21.
//

import Foundation

class LocalStorage {
    private static var hasLaunched: String = "hasLaunched"
    private static var questionsList: String = "questionsList"
    private static var curQuestion: String = "currentQuestion"
    
    public static var launchedValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: hasLaunched)
        }
        
        get {
            UserDefaults.standard.string(forKey: hasLaunched) ?? "false"
        }
    }
    
    public static var questionsValue: [Question] {
        set {
            let data =  try! JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: questionsList)
        }
        
        get {
            var note: [Question] = []
            
            if let data = UserDefaults.standard.data(forKey: questionsList) {
                let decoder = JSONDecoder()
                note = try! decoder.decode([Question].self, from: data)
                return note
            }
            
            return note
        }
    }
    
    public static var currentQuestion: CurrentQuestion {
        set {
            let data = try! JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: curQuestion)
        }
        
        get {
            var note: CurrentQuestion = CurrentQuestion(question: blankQuestion(), position: 0, set: false)
            
            if let data = UserDefaults.standard.data(forKey: curQuestion) {
                let decoder = JSONDecoder()
                note = try! decoder.decode(CurrentQuestion.self, from: data)
                return note
            }
            
            return note
        }
    }
    
    public static func importDefaultQuestions() -> [Question] {
        let arr = readCSV()
        var list: [Question] = []
        
        for quest in arr {
            let question = Question(category: quest[0], question: quest[1], answer: quest[2])
            list.append(question)
        }
        
        return list
    }
    
    private static func readCSV() -> [[String]] {
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
}

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
        let q1 = Question(id: UUID(), category: "Genetics", question: "What type of bonds forms between adenine and thymine?", answer: "Weak hydrogen bonds")
        let q2 = Question(id: UUID(), category: "Cellular", question: "What type of RNA brings the amino acid to the ribosome?", answer: "tRNA")
        return [q1, q2]
    }
}

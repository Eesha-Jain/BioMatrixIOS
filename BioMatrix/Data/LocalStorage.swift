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
    private static var coins: String = "coins"
    
    public static var launchedValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: hasLaunched)
        }
        
        get {
            UserDefaults.standard.string(forKey: hasLaunched) ?? "false"
        }
    }
    
    public static var coinsValue: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: coins)
        }
        
        get {
            UserDefaults.standard.integer(forKey: coins)
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
}

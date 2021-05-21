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
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(newValue)
                UserDefaults.standard.set(data, forKey: questionsList)
            } catch {
                print("Unable to Encode Note (\(error))")
            }
        }
        
        get {
            var note: [Question] = []
            
            if let data = UserDefaults.standard.data(forKey: "note") {
                do {
                    let decoder = JSONDecoder()
                    note = try decoder.decode([Question].self, from: data)
                    return note
                } catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
            
            return note
        }
    }
    
    public static func importDefaultQuestions() {
        let q1 = Question(id: UUID(), category: "Genetics", question: "What type of bond forms between adenine and thymine?", answer: "Weak hydrogen bonds")
        LocalStorage.questionsValue = [q1]
    }
}

/*
 struct Question: Identifiable {
     var id = UUID()
     var category: String
     var question: String
     var answer: String
     var starred: Bool = false
 }
 */

//
//  Question.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 5/18/21.
//

import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    let category: String
    let question: String
    let answer: [String]
    var starred: Bool = false
}

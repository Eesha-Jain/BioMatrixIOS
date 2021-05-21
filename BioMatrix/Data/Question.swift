//
//  Question.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 5/18/21.
//

import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    var category: String
    var question: String
    var answer: String
    var starred: Bool = false
}

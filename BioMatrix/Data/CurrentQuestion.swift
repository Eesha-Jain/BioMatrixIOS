//File CurrentQuestion.swift in Project BioMatrix: Created by Eesha Jain on 5/31/21

import Foundation

struct CurrentQuestion: Codable {
    var question: Question
    var position: Int
    var set: Bool
}

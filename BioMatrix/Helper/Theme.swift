//File Theme.swift in Project BioMatrix: Created by Eesha Jain on 6/25/21

import Foundation

struct Theme: Identifiable {
    var id: String { name }
    var name: String
    var cost: Int
}

struct ColorType: Identifiable {
    var id: String { name }
    var name: String
}

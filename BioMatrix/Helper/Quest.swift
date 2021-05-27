//File Quest.swift in Project BioMatrix: Created by Eesha Jain on 5/22/21

import SwiftUI

struct Quest: View {
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.category)
                .foregroundColor(Color("Text"))
                .font(Font.custom("Roboto-Regular", size: 20))
            
            Text(question.question)
                .foregroundColor(Color("Text"))
                .font(Font.custom("Roboto-Light", size: 20))
        }
    }
}

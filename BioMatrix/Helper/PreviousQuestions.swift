//File PreviousQuestions.swift in Project BioMatrix: Created by Eesha Jain on 6/22/21

import SwiftUI

struct PreviousQuestions: View {
    var list: [Question] = []
    
    var body: some View {
        ForEach(list) { q in
            HStack {
                Text(q.category)
                    .font(Font.custom("Roboto-Medium", size: 20))
                    .foregroundColor(Color("Text"))
                Spacer()
                Text(q.answer[0])
                    .font(Font.custom("Roboto-Light", size: 20))
                    .foregroundColor(Color("Text"))
            }.padding(10)
        }.frame(width: UIScreen.main.bounds.size.width * 0.89)
        .background(
            RoundedRectangle(
                cornerRadius: 12,
                style: .continuous
            )
            .fill(Color("Red"))
        )
        .padding([.bottom], 5)
    }
}

struct PreviousQuestions_Previews: PreviewProvider {
    static var previews: some View {
        PreviousQuestions(list: [])
    }
}

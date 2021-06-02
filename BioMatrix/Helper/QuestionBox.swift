//File QuestionBox.swift in Project BioMatrix: Created by Eesha Jain on 5/29/21

import SwiftUI

struct QuestionBox: View {
    @State var question: Question = LocalStorage.currentQuestion.question
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Text(question.category)
                        .foregroundColor(Color("Text"))
                        .font(Font.custom("Roboto-Regular", size: 20))
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(question.starred ? "StarYes" : "StarNo"))
                        .onTapGesture {
                            changeStarred()
                            question = LocalStorage.currentQuestion.question
                        }
                }
                
                Text(question.question)
                    .foregroundColor(Color("Text"))
                    .font(Font.custom("Roboto-Light", size: 20))
                
            }.padding(10)
        }
        .frame(width: UIScreen.main.bounds.size.width * 0.89)
        .background(
            RoundedRectangle(
                cornerRadius: 12,
                style: .continuous
            )
            .fill(Color("Red"))
        )
        .padding([.bottom], 5)
        .onAppear(perform: {
            question = LocalStorage.currentQuestion.question
        })
    }
}

struct QuestionBox_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBox()
    }
}

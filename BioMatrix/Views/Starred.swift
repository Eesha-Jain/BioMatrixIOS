//
//  Starred.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

/*
 NEXT TO IMPLEMENT: CLICK TO REVEAL ANSWER
 AFTER THAT: DATABASE OF QUESTIONS
 THEN DONE!
 */

import SwiftUI

struct Starred: View {
    @State var starredQuestions: [Question] = getStarredQuestions()
    
    var body: some View {
        VStack {
            if (starredQuestions.count > 0) {
                ForEach(starredQuestions) { question in
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text(question.category)
                                    .foregroundColor(Color("Text"))
                                    .font(Font.custom("Roboto-Regular", size: 20))
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("StarYes"))
                                    .onTapGesture {
                                        changeStarredPage(q: question)
                                        starredQuestions = getStarredQuestions()
                                    }
                            }
                            
                            Text(question.question)
                                .foregroundColor(Color("Text"))
                                .font(Font.custom("Roboto-Light", size: 20))
                                .padding([.bottom], 5)
                            
                            HStack {
                                Text("Answer: " + question.answer)
                                    .foregroundColor(Color("Text"))
                                    .font(Font.custom("Roboto-LightItalic", size: 20))
                                Spacer()
                            }.padding([.leading], 20)
                            
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
                }
            } else {
                HStack {
                    Text("No starred questions")
                        .foregroundColor(Color("OppositeGray"))
                        .font(Font.custom("Roboto-LightItalic", size: 20))
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("OppositeGray"))
                }
            }
        }
    }
}

struct Starred_Previews: PreviewProvider {
    static var previews: some View {
        Starred()
    }
}

//  TurtleRound.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

import SwiftUI

struct TurtleRound: View {
    //Answer Variables
    @State var answer: String = ""
    @State var correct: String = ""
    @State var opacity: Double = 0
    @State var color: String = "White"
    
    //Other Variables
    @State var question = LocalStorage.currentQuestion.question
    @State var list: [Question] = []
   
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    //BioMatrix Text
                    LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 50)
                        .mask(Text("BIOMATRIX"))
                        .foregroundColor(Color("Purple"))
                        .font(Font.custom("Roboto-Bold", size: 60))
                        .padding([.bottom], 10)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        .animation(.easeOut)
                    
                    //Question
                    QuestionBox()
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        .animation(.easeOut)
                    
                    //Input
                    HStack {
                        TextField("Type your answer...", text: $answer)
                            .autocapitalization(.none)
                            .padding(13)
                            .frame(width: UIScreen.main.bounds.size.width * 0.60)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color("Answer"))
                            )
                            .foregroundColor(Color("OppositeText"))
                            .font(Font.custom("Roboto-Light", size: 20))
                        
                        Button(action: {
                            if (correct == "") {
                                opacity = 100
                                if (answer.lowercased() == question.answer.lowercased()) {
                                    correct = "Correct"
                                    color = "Correct"
                                } else {
                                    correct = "Incorrect"
                                    color = "Incorrect"
                                }
                            }
                        }, label: {
                            Text("Submit")
                        })
                        .padding(13)
                        .frame(width: UIScreen.main.bounds.size.width * 0.25)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color("Submit"))
                        )
                        .foregroundColor(Color("OppositeText"))
                        .font(Font.custom("Roboto-Light", size: 20))
                    }.padding([.bottom], 10)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    .animation(.easeOut)
                    
                    //Next
                    Button(action: {
                        list.insert(question, at: 0)
                        if (list.count > 5) {
                            list.remove(at: 5)
                        }
                        
                        question = newQuestion()
                        opacity = 0
                        answer = ""
                        color = "White"
                        correct = ""
                    }, label: {
                        Text("Next")
                    }).padding(13)
                    .frame(width: UIScreen.main.bounds.size.width * 0.9)
                    .background(
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                            .fill(Color("Purple"))
                    )
                    .foregroundColor(Color("Text"))
                    .font(Font.custom("Roboto-Light", size: 20))
                    .opacity(opacity)
                    .padding([.bottom], 10)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    .animation(.easeOut)
                    
                    //Make Text go to Top
                    Spacer()
                    
                    //Previous questions
                    ForEach(list) { q in
                        HStack {
                            Text(q.category)
                                .font(Font.custom("Roboto-Medium", size: 20))
                                .foregroundColor(Color("Text"))
                            Spacer()
                            Text(q.answer)
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
            
            Spacer()
            
            //Bottom message
            VStack {
                Text("\(correct)")
                    .font(Font.custom("Roboto-Bold", size:20))
                    .foregroundColor(Color("OppositeText"))
            }
            .frame(width: UIScreen.main.bounds.size.width, height: 40)
            .background(Color(color).edgesIgnoringSafeArea(.bottom))
            .opacity(opacity)
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            .animation(.easeOut)
        }
    }
}

struct TurtleRound_Previews: PreviewProvider {
    static var previews: some View {
        TurtleRound()
    }
}

//
//  SpeedRound.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.

import SwiftUI

struct SpeedRound: View {
    //Timer Variables
    @State var timeRemaining = 7
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //Answer Variables
    @State var answer: String = ""
    @State var correct: String = ""
    @State var opacity: Double = 0
    @State var color: String = "\(LocalStorage.appThemeValue)White"
    
    //Other Variables
    @State var question = LocalStorage.currentQuestion.question
    @State var list: [Question] = []
   
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    //BioMatrix Text
                    LinearGradient(gradient: Gradient(colors: [Color("\(LocalStorage.appThemeValue)Purple"), Color("\(LocalStorage.appThemeValue)Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 50)
                        .mask(Text("BIOMATRIX"))
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Purple"))
                        .font(Font.custom("Roboto-Bold", size: 60))
                        .padding([.bottom], 10)
                        .animation(.easeIn)
                        .animation(.easeOut)
                    
                    //Time Remaining
                    Text("0:0\(timeRemaining)").onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            if (correct == "") {
                                opacity = 100
                                correct = "Time's Up! Answer: \(question.answer)"
                                color = "\(LocalStorage.appThemeValue)Incorrect"
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width * 0.85)
                    .padding(10)
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeText"))
                    .font(Font.custom("Roboto-Bold", size: 30))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("\(LocalStorage.appThemeValue)Gray"))
                    ).padding([.bottom], 10)
                    .animation(.easeIn)
                    .animation(.easeOut)
                    
                    //Question
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text(question.category)
                                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                                    .font(Font.custom("Roboto-Regular", size: 20))
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(question.starred ? "\(LocalStorage.appThemeValue)StarYes" : "\(LocalStorage.appThemeValue)StarYes"))
                                    .onTapGesture {
                                        changeStarred()
                                        question = LocalStorage.currentQuestion.question
                                    }
                            }
                            
                            Text(question.question)
                                .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                                .font(Font.custom("Roboto-Light", size: 20))
                            
                        }.padding(10)
                    }
                    .frame(width: UIScreen.main.bounds.size.width * 0.89)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 12,
                            style: .continuous
                        )
                        .fill(Color("\(LocalStorage.appThemeValue)Red"))
                    )
                    .padding([.bottom], 5)
                    .animation(.easeIn)
                    .animation(.easeOut)
                    
                    //Input
                    HStack {
                        TextField("Type your answer...", text: $answer)
                            .autocapitalization(.none)
                            .padding(13)
                            .frame(width: UIScreen.main.bounds.size.width * 0.60)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(Color("\(LocalStorage.appThemeValue)Answer"))
                            )
                            .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeText"))
                            .font(Font.custom("Roboto-Light", size: 20))
                        
                        Button(action: {
                            if (timeRemaining != 0 && correct == "") {
                                timeRemaining = 0
                                opacity = 100
                                var right = false;
                                
                                for ans in question.answer {
                                    if (answer.lowercased() == ans.lowercased()) {
                                        right = true;
                                    }
                                }
                                
                                if (right) {
                                    correct = "Correct"
                                    color = "\(LocalStorage.appThemeValue)Correct"
                                    LocalStorage.coinsValue += 20
                                } else {
                                    LocalStorage.coinsValue -= 5
                                    correct = "Incorrect. Answer: \(question.answer[0])"
                                    color = "\(LocalStorage.appThemeValue)Incorrect"
                                }
                            }
                        }, label: {
                            Text("Submit")
                        })
                        .padding(13)
                        .frame(width: UIScreen.main.bounds.size.width * 0.25)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color("\(LocalStorage.appThemeValue)Submit"))
                        )
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeText"))
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
                        
                        timeRemaining = 7
                        question = newQuestion()
                        opacity = 0
                        answer = ""
                        color = "\(LocalStorage.appThemeValue)White"
                        correct = ""
                    }, label: {
                        Text("Next")
                    }).padding(13)
                    .frame(width: UIScreen.main.bounds.size.width * 0.9)
                    .background(
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                            .fill(Color("\(LocalStorage.appThemeValue)Purple"))
                    )
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                    .font(Font.custom("Roboto-Light", size: 20))
                    .opacity(opacity)
                    .padding([.bottom], 10)
                    .animation(.easeIn)
                    .animation(.easeOut)
                    
                    //Make Text go to Top
                    Spacer()
                    
                    //Previous questions
                    PreviousQuestions(list: list)
                }
            }
            
            Spacer()
            
            //Bottom message
            VStack {
                Text("\(correct)")
                    .font(Font.custom("Roboto-Bold", size:20))
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeText"))
            }
            .padding(10)
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color(color).edgesIgnoringSafeArea(.bottom))
            .opacity(opacity)
            .animation(.easeIn)
            .animation(.easeOut)
        }.onAppear(perform: {
            question = LocalStorage.currentQuestion.question
        })
    }
}

struct SpeedRound_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpeedRound()
                
        }
    }
}

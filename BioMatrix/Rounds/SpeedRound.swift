//
//  SpeedRound.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.

import SwiftUI

struct SpeedRound: View {
    @State var timeRemaining = 7
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    fileprivate func getRandomQuestion() -> Quest {
        let list = LocalStorage.importDefaultQuestions()
        //let list = LocalStorage.questionsValue
        let randomInt = Int.random(in: 1..<list.count)
        let question = list[randomInt]
        return Quest(question: question)
    }
    
    fileprivate func getRandomQuestionTESTT() -> Quest {
        let q1 = Question(id: UUID(), category: "Genetics", question: "What type of bond forms between adenine and thymine?", answer: "Weak hydrogen bonds")
        let list = [q1]
        let randomInt = 0
        let question = list[randomInt]
        
        return Quest(question: question)
    }

    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 50)
                .mask(Text("BIOMATRIX"))
                .foregroundColor(Color("Purple"))
                .font(Font.custom("Roboto-Bold", size: 60))
                .padding([.bottom], 10)
            
            Text("0:0\(timeRemaining)").onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .padding(10)
            .padding([.leading, .trailing], 150)
            .foregroundColor(Color("OppositeText"))
            .font(Font.custom("Roboto-Bold", size: 30))
            .cornerRadius(25)
            .background(
                RoundedRectangle(
                    cornerRadius: 100,
                    style: .continuous
                )
                .fill(Color("Gray"))
            )
            
            VStack {
                getRandomQuestionTESTT()
                    .padding(10)
            }.background(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .fill(Color("Red"))
            ).padding(8)
            
            Spacer()
        }
    }
}

struct SpeedRound_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpeedRound()
                .preferredColorScheme(.dark)
        }
    }
}

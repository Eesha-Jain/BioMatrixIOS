//
//  SpeedRound.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.

import SwiftUI

struct SpeedRound: View {
    @State var timeRemaining = 7
    @State var question = blankQuestion()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
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
                Quest(question: question)
                    .padding(10)
            }.background(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .fill(Color("Red"))
            ).padding(8)
            
            Spacer()
        }.onAppear {
            question = newQuestion()
        }
    }
}

struct SpeedRound_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpeedRound()
        }
    }
}

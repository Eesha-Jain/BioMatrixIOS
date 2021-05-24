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
            //BioMatrix Text
            LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 50)
                .mask(Text("BIOMATRIX"))
                .foregroundColor(Color("Purple"))
                .font(Font.custom("Roboto-Bold", size: 60))
                .padding([.bottom], 10)
            
            //Time Remaining
            Text("0:0\(timeRemaining)").onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.85)
            .padding(10)
            .foregroundColor(Color("OppositeText"))
            .font(Font.custom("Roboto-Bold", size: 30))
            .cornerRadius(25)
            .background(
                RoundedRectangle(
                    cornerRadius: 100,
                    style: .continuous
                )
                .fill(Color("Gray"))
            ).padding([.bottom], 10)
            
            //Question
            VStack {
                Quest(question: question)
                    .padding(10)
            }.frame(width: UIScreen.main.bounds.size.width * 0.89)
            .background(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .fill(Color("Red"))
            )
            
            //Input
            
            //Make Text go to Top
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

//File PickRound.swift in Project BioMatrix: Created by Eesha Jain on 4/25/21

import SwiftUI

struct PickRound: View {
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 50)
                        .mask(Text("BIOMATRIX"))
                        .foregroundColor(Color("Purple"))
                        .font(Font.custom("Roboto-Bold", size: 60))
                    
                    Spacer()
                    
                    NavigationLink(destination: TurtleRound()) {
                        Text("Turtle Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("Red"))
                    )
                    
                    NavigationLink(destination: TimerRound()) {
                        Text("Timer Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("Red"))
                    )
                    
                    NavigationLink(destination: SpeedRound()) {
                        Text("Speed Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("Red"))
                    )
                    
                    Spacer()
                }
            }
        }
    }
}

struct PickRound_Previews: PreviewProvider {
    static var previews: some View {
        PickRound()
    }
}

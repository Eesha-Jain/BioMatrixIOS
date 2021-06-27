//File PickRound.swift in Project BioMatrix: Created by Eesha Jain on 4/25/21
 
import SwiftUI

struct PickRound: View {
    @State var coins: Int = LocalStorage.coinsValue
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color("\(LocalStorage.appThemeValue)Purple"), Color("\(LocalStorage.appThemeValue)Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 50)
                        .mask(Text("BIOMATRIX"))
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Purple"))
                        .font(Font.custom("Roboto-Bold", size: 60))
                    
                    Spacer()
                    
                    NavigationLink(destination: TurtleRound()) {
                        Text("Turtle Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("\(LocalStorage.appThemeValue)Red"))
                    )
                    
                    NavigationLink(destination: TimerRound()) {
                        Text("Timer Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("\(LocalStorage.appThemeValue)Red"))
                    )
                    
                    NavigationLink(destination: SpeedRound()) {
                        Text("Speed Round")
                    }.padding(20)
                    .padding([.leading, .trailing], 100)
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                    .cornerRadius(25)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("\(LocalStorage.appThemeValue)Red"))
                    )
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "circlebadge.2.fill")
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Coin"))
                        .padding([.leading], 20)
                    Text("\(coins)")
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Coin"))
                    
                    Spacer()
                }
                .padding([.top, .bottom], 5)
                .background(Color("\(LocalStorage.appThemeValue)SlightGray"))
            }.onAppear(perform: {
                LocalStorage.currentQuestion.question = newQuestion()
                coins = LocalStorage.coinsValue
            })
        }.background(Color("\(LocalStorage.appThemeValue)Background").ignoresSafeArea())
    }
}

struct PickRound_Previews: PreviewProvider {
    static var previews: some View {
        PickRound()
    }
}

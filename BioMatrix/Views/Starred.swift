//
//  Starred.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

import SwiftUI

struct Starred: View {
    @State var starredQuestions: [Question] = getStarredQuestions()
    @State var coins: Int = LocalStorage.coinsValue
    
    var body: some View {
        VStack {
            Spacer()
            
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
                                    Text("Answer: " + question.answer[0])
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
            }.onAppear {
                starredQuestions = getStarredQuestions()
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "circlebadge.2.fill")
                    .foregroundColor(Color("Coin"))
                    .padding([.leading], 20)
                Text("\(coins) Coins")
                    .foregroundColor(Color("Coin"))
                
                Spacer()
            }
            .padding([.top, .bottom], 5)
            .background(Color("SlightGray"))
        }.onAppear {
            coins = LocalStorage.coinsValue
        }
    }
}

struct Starred_Previews: PreviewProvider {
    static var previews: some View {
        Starred()
    }
}

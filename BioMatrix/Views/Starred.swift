//
//  Starred.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

import SwiftUI

struct Starred: View {
    @State var starredQuestions: [Question] = getStarredQuestions()
    @State var selectedTheme: String = LocalStorage.appThemeValue
    @State var coins: Int = LocalStorage.coinsValue
    
    var body: some View {
        ZStack {
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
                                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                                        .font(Font.custom("Roboto-Regular", size: 20))
                                    Spacer()
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("\(LocalStorage.appThemeValue)StarYes"))
                                        .onTapGesture {
                                            changeStarredPage(q: question)
                                            starredQuestions = getStarredQuestions()
                                        }
                                }
                                
                                Text(question.question)
                                    .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
                                    .font(Font.custom("Roboto-Light", size: 20))
                                    .padding([.bottom], 5)
                                
                                HStack {
                                    Text("Answer: " + question.answer[0])
                                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Text"))
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
                            .fill(Color("\(LocalStorage.appThemeValue)Red"))
                        )
                        .padding([.bottom], 5)
                    }
                } else {
                    HStack {
                        Text("No starred questions")
                            .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeGray"))
                            .font(Font.custom("Roboto-LightItalic", size: 20))
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeGray"))
                    }
                }
            }.onAppear {
                starredQuestions = getStarredQuestions()
            }
            
            Spacer()
            
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
        }.onAppear {
            coins = LocalStorage.coinsValue
        }
        }.background(Color("\(selectedTheme)Background").ignoresSafeArea())
        .onAppear {
            selectedTheme = LocalStorage.appThemeValue
        }
    }
}

struct Starred_Previews: PreviewProvider {
    static var previews: some View {
        Starred()
    }
}

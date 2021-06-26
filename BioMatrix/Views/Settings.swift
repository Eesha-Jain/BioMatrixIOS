//File Settings.swift in Project BioMatrix: Created by Eesha Jain on 6/24/21

import SwiftUI

struct Settings: View {
    private var themeList: [Theme] = [Theme(name: "Normal", cost: 0), Theme(name: "Dark", cost: 0)]
    private var colorList: [ColorType] = [
        ColorType(name: "Background"),
        ColorType(name: "Answer"),
        ColorType(name: "Submit"),
        ColorType(name: "Correct"),
        ColorType(name: "Incorrect"),
        ColorType(name: "SlightGray"),
        ColorType(name: "Purple"),
        ColorType(name: "Blue"),
        ColorType(name: "Coin"),
        ColorType(name: "OppositeGray"),
        ColorType(name: "Gray"),
        ColorType(name: "OppositeText"),
        ColorType(name: "Red"),
        ColorType(name: "StarNo"),
        ColorType(name: "StarYes"),
        ColorType(name: "Text"),
        ColorType(name: "White")
    ]
    
    @State private var selectedTheme = LocalStorage.appThemeValue
    @State var coins: Int = LocalStorage.coinsValue
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("\(selectedTheme)Purple"), Color("\(selectedTheme)Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 50)
                .mask(Text("BIOMATRIX"))
                .foregroundColor(Color("\(selectedTheme)Purple"))
                .font(Font.custom("Roboto-Bold", size: 60))
            
            Picker(selection: $selectedTheme, label: Text("Pick a Theme").foregroundColor(Color("\(selectedTheme)OppositeText"))) {
                ForEach(0 ..< themeList.count) {
                    Text(themeList[$0].name)
                }
            }
            .onChange(of: selectedTheme, perform: { value in
                LocalStorage.appThemeValue = selectedTheme
            })
            
            ForEach(themeList) { theme in
                HStack {
                    Text(theme.name + " - ")
                        .font(Font.custom("Roboto-Bold", size: 20))
                        .foregroundColor(Color("\(selectedTheme)OppositeText"))
                    
                    Image(systemName: "circlebadge.2.fill")
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Coin"))
                    
                    Text("\(theme.cost)")
                        .foregroundColor(Color("\(LocalStorage.appThemeValue)Coin"))
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(colorList) { color in
                            Rectangle()
                                .fill(Color("\(theme.name)\(color.name)"))
                                .border(Color.black, width: 0.25)
                                .frame(width: 40, height: 40)
                        }
                    }
                }
                .padding(10)
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
        }
        .onAppear {
            selectedTheme = LocalStorage.appThemeValue
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

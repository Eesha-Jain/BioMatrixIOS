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
        ColorType(name: "BackOppo"),
        ColorType(name: "White")
    ]
    
    @State var selectedTheme: String = LocalStorage.appThemeValue
    @State var coins: Int = LocalStorage.coinsValue
    
    var body: some View {
        ZStack {
            VStack {
                LinearGradient(gradient: Gradient(colors: [Color("\(selectedTheme)Purple"), Color("\(selectedTheme)Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: 50)
                    .mask(Text("SETTINGS"))
                    .foregroundColor(Color("\(selectedTheme)Purple"))
                    .font(Font.custom("Roboto-Bold", size: 40))
                
                Picker(selection: $selectedTheme, label:
                        Text("Click to Change Theme from \(selectedTheme)")
                        .foregroundColor(Color("\(selectedTheme)OppositeText"))
                        .font(Font.custom("Roboto-Light", size: 20))
                ) {
                    ForEach(0 ..< themeList.count) {
                        Text(themeList[$0].name).tag(themeList[$0].name)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding([.top, .bottom], 30)
                .onChange(of: selectedTheme, perform: { (value) in
                    LocalStorage.appThemeValue = selectedTheme
                })
                
                ForEach(themeList) { theme in
                    HStack {
                        Text(theme.name + " - ")
                            .font(Font.custom("Roboto-Bold", size: 20))
                            .foregroundColor(Color("\(selectedTheme)OppositeText"))
                        
                        Image(systemName: "circlebadge.2.fill")
                            .foregroundColor(Color("\(selectedTheme)Coin"))
                        
                        Text("\(theme.cost)")
                            .foregroundColor(Color("\(selectedTheme)Coin"))
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(colorList) { color in
                                Rectangle()
                                    .fill(Color("\(theme.name)\(color.name)"))
                                    .border(Color("\(selectedTheme)BackOppo"), width: 0.25)
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .padding(10)
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "circlebadge.2.fill")
                        .foregroundColor(Color("\(selectedTheme)Coin"))
                        .padding([.leading], 20)
                    Text("\(coins)")
                        .foregroundColor(Color("\(selectedTheme)Coin"))
                    
                    Spacer()
                }
                .padding([.top, .bottom], 5)
                .background(Color("\(selectedTheme)SlightGray"))
            }
            .onAppear {
                selectedTheme = LocalStorage.appThemeValue
            }
            
        }
        .background(Color("\(selectedTheme)Background").ignoresSafeArea())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

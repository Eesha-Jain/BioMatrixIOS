//File Settings.swift in Project BioMatrix: Created by Eesha Jain on 6/24/21

import SwiftUI

struct Settings: View {
    private var themeList: [Theme] = [Theme(name: "Normal"), Theme(name: "Dark")]
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
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("\(LocalStorage.appThemeValue)Purple"), Color("\(LocalStorage.appThemeValue)Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 50)
                .mask(Text("BIOMATRIX"))
                .foregroundColor(Color("\(LocalStorage.appThemeValue)Purple"))
                .font(Font.custom("Roboto-Bold", size: 60))
            
            Spacer()
            
            ForEach(themeList) { theme in
                Text(theme.name)
                    .font(Font.custom("Roboto-Bold", size: 20))
                    .foregroundColor(Color("\(LocalStorage.appThemeValue)OppositeText"))
                
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
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

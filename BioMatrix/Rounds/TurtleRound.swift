//
//  TurtleRound.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

import SwiftUI

struct TurtleRound: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 50)
                .mask(Text("BIOMATRIX"))
                .foregroundColor(Color("Purple"))
                .font(Font.custom("Roboto-Bold", size: 60))
            
            Spacer()
            
            Text("Hello, World!")
            
            Spacer()
        }
    }
}

struct TurtleRound_Previews: PreviewProvider {
    static var previews: some View {
        TurtleRound()
    }
}

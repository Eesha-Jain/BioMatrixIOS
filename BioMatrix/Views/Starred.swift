//
//  Starred.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/25/21.
//

import SwiftUI

struct Starred: View {
    var body: some View {
        VStack {
            List {
                /*
                ForEach(questions, id: \.id) { question in
                    VStack {
                        Text(question.category ?? "Error - no question")
                            .font(Font.custom("Roboto-Regular", size: 12))
                        Text(question.question ?? "Error - no question")
                    }.padding(10)
                    .padding([.leading, .trailing], 150)
                    .foregroundColor(Color("OppositeText"))
                    .font(Font.custom("Roboto-Bold", size: 30))
                    .cornerRadius(7)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 100,
                            style: .continuous
                        )
                        .fill(Color("Red"))
                    )
                }*/
            }
        }
    }
}

struct Starred_Previews: PreviewProvider {
    static var previews: some View {
        Starred()
    }
}

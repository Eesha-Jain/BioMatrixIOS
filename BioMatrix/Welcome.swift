//
//  Welcome.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 5/18/21.
//

import SwiftUI

struct Welcome: View {
    @State private var actionState: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack {
                //Image
                Image("Paint")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                
                //Title
                LinearGradient(
                    gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .topLeading, endPoint: .bottomTrailing
                ).mask (
                    Text("Welcome to BioMatrix!")
                        .font(Font.custom("Roboto-Bold", size: 30))
                )
                .padding(0)
                .frame(width: 450, height: 50)
                
                //Sub
                LinearGradient(
                    gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .topLeading, endPoint: .bottomTrailing
                ).mask (
                    Text("Pick a round and answer biology questions!")
                        .font(Font.custom("Roboto-Light", size: 16))
                )
                .padding(0)
                .frame(height: 20)
                
                Spacer()
                
                //Button
                NavigationLink(destination: ContentView()
                                //.navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("BioMatrix", displayMode: .inline)
                , tag: 1, selection: $actionState) {}
                
                Button(action: {
                    LocalStorage.questionsValue = LocalStorage.importDefaultQuestions()
                    LocalStorage.launchedValue = "true"
                    self.actionState = 1
                }, label: {
                    Text("Get Started!")
                })
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(7)
                .foregroundColor(.white)
                .font(Font.custom("Roboto-Light", size: 16))
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

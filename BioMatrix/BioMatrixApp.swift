//
//  BioMatrixApp.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/23/21.
//

import SwiftUI

@main
struct BioMatrixApp: App {
    var body: some Scene {
        WindowGroup {
            if (LocalStorage.launchedValue == "false") {
                ZStack {
                    Welcome()
                }
                .background(Color("\(LocalStorage.appThemeValue)Background"))
                .edgesIgnoringSafeArea(.all)
            } else {
                ZStack {
                    ContentView().onAppear {
                        LocalStorage.currentQuestion.set = false
                    }
                }
                .background(Color("\(LocalStorage.appThemeValue)Background"))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

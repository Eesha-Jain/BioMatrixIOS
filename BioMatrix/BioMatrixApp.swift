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
                Welcome()
            } else {
                ContentView().onAppear {
                    LocalStorage.currentQuestion.set = false
                }
            }
        }
    }
}

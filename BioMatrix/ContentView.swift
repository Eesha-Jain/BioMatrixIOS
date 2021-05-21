//
//  ContentView.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PickRound()
                .tabItem {
                    Image(systemName: "puzzlepiece.fill")
                    Text("BioMatrix")
                }
            
            Starred()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Starred")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  BioMatrix
//
//  Created by Jain, Eesha on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                
                Settings()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

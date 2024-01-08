//
//  ContentView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "person")
            }
            
            StoryView().tabItem {
                Label("Story", systemImage: "book")
            }
            
            FavoritesView().tabItem {
                Label("Favorites", systemImage: "star")
            }
            
            FunFactsView().tabItem {
                Label("Fun Facts", systemImage: "hand.thumbsup")
            }
        }
        .tint(.orange)
    }
}

#Preview {
    ContentView()
}

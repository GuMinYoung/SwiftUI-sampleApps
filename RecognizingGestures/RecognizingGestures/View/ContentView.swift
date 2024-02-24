//
//  ContentView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination: TapView()) {
                    GestureRowView(with: GestureType.tap.rowInfo)
                }
            }.navigationTitle("Gestures")
        }
    }
}

#Preview {
    ContentView()
}

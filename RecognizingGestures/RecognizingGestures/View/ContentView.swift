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
                NavigationLink(destination: LongPressView()) {
                    GestureRowView(with: GestureType.touchAndHold.rowInfo)
                }
                NavigationLink(destination: DragView()) {
                    GestureRowView(with: GestureType.drag.rowInfo)
                }
                NavigationLink(destination: RotateView()) {
                    GestureRowView(with: GestureType.rotate.rowInfo)
                }
                NavigationLink(destination: SingleLineView()) {
                    GestureRowView(with: GestureType.lineDrawing.rowInfo)
                }
            }.navigationTitle("Gestures")
        }
    }
}



#Preview {
    ContentView()
}

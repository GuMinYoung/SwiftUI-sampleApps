//
//  TapView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

import SwiftUI

struct TapView: View, IncludeGesture {
    @State private var color: Color = Color.black
    var gestureType = GestureType.tap
    
    var gesture: some Gesture {
        TapGesture()
            .onEnded {_ in
                withAnimation {
                    color = Color.random()
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("사각형을 탭하여 색상 변경")
            Spacer()
            Rectangle()
                .foregroundStyle(color)
                .gesture(gesture)
        }
        .padding()
        .navigationTitle(gestureType.navigationTitle)
        .padding()
        .toolbar {
            Button("Reset") {
                color = Color.primary
            }
        }
    }
}



#Preview {
    TapView()
}

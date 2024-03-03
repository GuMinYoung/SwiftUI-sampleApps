//
//  RotateView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 3/3/24.
//

import SwiftUI

struct RotateView: View, IncludeGesture {
    @State private var angle: Angle = .zero
    var gestureType = GestureType.rotate
    
    var gesture: some Gesture {
        RotateGesture()
            .onChanged { self.angle = $0.rotation }
            .onEnded { self.angle = $0.rotation }
    }
    
    var body: some View {
        VStack {
            Text("두 손가락으로 사각형을 회전")
            Spacer()
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundStyle(Color.yellow)
                .rotationEffect(angle)          // 이걸 써야 RotateGesture가 먹힘
                .gesture(gesture)
            Spacer()
        }
        .padding()
        .navigationTitle(gestureType.navigationTitle)
        .padding()
        .toolbar {
            Button("Reset") {
                angle = .zero
            }
        }
    }
}



#Preview {
    RotateView()
}

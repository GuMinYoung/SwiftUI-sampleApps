//
//  DragView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 3/1/24.
//

import SwiftUI

struct DragView: View, IncludeGesture {
    private let circleSize: CGFloat = 250
    @State private var didTap = false
    @State private var offset: CGSize = .zero
    var gestureType = GestureType.drag
    
    var gesture: some Gesture {
        DragGesture()
            .onChanged {
                offset = CGSize(width: $0.startLocation.x + $0.translation.width - circleSize/2,
                       height: $0.startLocation.y + $0.translation.height - circleSize/2)
                didTap = true
            }
            .onEnded { _ in
                withAnimation {
                    didTap = false
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("원을 드래그해서 위치 이동")
            Spacer()
            Circle()
                .frame(width: circleSize, height: circleSize)
                .offset(offset)
                .foregroundStyle(Color.orange)
                .gesture(gesture)
                .scaleEffect(didTap ? 1.1 : 1.0)
            Spacer()
        }
        .padding()
        .navigationTitle(gestureType.navigationTitle)
        .padding()
        .toolbar {
            Button("Reset") {
                offset = .zero
            }
        }
    }
}



#Preview {
    DragView()
}

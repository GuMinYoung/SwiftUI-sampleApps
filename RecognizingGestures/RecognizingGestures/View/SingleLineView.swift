//
//  SingleLineView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 3/4/24.
//

import SwiftUI

struct SingleLineView: View, IncludeGesture {
    @State var startPos: CGPoint = .zero
    @State var endPos: CGPoint = .zero
    @State var color: Color = .clear
    var gestureType = GestureType.lineDrawing
    
    var gesture: some Gesture {
        DragGesture()
            .onChanged { value in
                startPos = value.startLocation
                endPos = value.location
                color = .teal
            }
            .onEnded { value in
                endPos = value.location
            }
    }
    
    var body: some View {
        VStack {
            Text("드래그해서 직선 그리기")
            Spacer()
            Path { path in
                path.move(to: startPos)
                path.addLine(to: endPos)
            }
                .stroke(color, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .contentShape(Rectangle())  // 터치 가능한 영역 설정
                .gesture(gesture)
                
            Spacer()
        }
        
        .padding()
        .navigationTitle(gestureType.navigationTitle)
        .padding()
        .toolbar {
            Button("Reset") {
                color = .clear
                startPos = .zero
                endPos = .zero
            }
        }
    }
}



#Preview {
    SingleLineView()
}



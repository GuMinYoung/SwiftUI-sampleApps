//
//  LongPressView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/28/24.
//

import SwiftUI

struct LongPressView: View, IncludeGesture {
    private static let defaultSize = CGSize(width: 100, height: 50)
    @State private var size: CGSize = defaultSize
    var gestureType = GestureType.touchAndHold
    
    var gesture: some Gesture {
        LongPressGesture()
            .onEnded {_ in
                withAnimation {
                    let width = Int.random(in: 50..<250)
                    let height = Int.random(in: 50..<250)
                        self.size = CGSize(width: width, height: height)
                    
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("캡슐을 누르고 있으면 크기 변경")
            Spacer()
            Capsule()
                .frame(width: size.width, height: size.height)
                .foregroundStyle(Color.indigo)
                .gesture(gesture)
            Spacer()
        }
        .padding()
        .navigationTitle(gestureType.navigationTitle)
        .padding()
        .toolbar {
            Button("Reset") {
                size = LongPressView.defaultSize
            }
        }.onAppear {
            size = LongPressView.defaultSize
        }
    }
}



#Preview {
    LongPressView()
}

//
//  StoryView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct StoryView: View {
    
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .bold()
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
            .background(.green)
        }
        .padding([.top, .bottom], 50)
    }
    
}

#Preview {
    StoryView()
}

//
//  StoryNavigationView.swift
//  ChooseYourOwnStory
//
//  Created by 구민영 on 1/13/24.
//

import SwiftUI

struct StoryNavigationView: View {
    let story: Story
    let pageIndex: Int
    
    var body: some View {
        VStack {
            ScrollView {
                Text(story[pageIndex].text)
                    .padding(.top)
            }
            
            ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
                NavigationLink(destination: StoryNavigationView(story: story, pageIndex: choice.destination)) {
                    Text(choice.text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                     // .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular)) 이렇게 style 지정도 가능
                    /// RoundedCornerStyle
                    /// .circular - 모서리가 정확히 1/4인 원 형태
                    /// .continuous - 모서리가 1/4보다 조금 더 둥근 원 형태
                    /// 육안상 큰 차이는 없다.
                }
            }
        }
        .padding([.leading, .trailing, .bottom])
        .navigationTitle("Page\(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StoryNavigationView(story: story, pageIndex: 0)
}

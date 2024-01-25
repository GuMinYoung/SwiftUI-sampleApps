//
//  ContentView.swift
//  ChooseYourOwnStory
//
//  Created by 구민영 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            StoryNavigationView(story: story, pageIndex: 0)
        }
    }
}

#Preview {
    ContentView()
}

/*
 1. NavigationStack
 - NavigationLink를 담는 스택
 2. NavigationLink
 - 네비게이션의 present 자체를 제어하는 뷰

 정리)
 NavigationStack 안에 NavigationLink가 쌓이는 방식이라고 이해함.
 UIKit의 UINavigationController와 동일하게 rootView를 표시하고 그 위에 다른 뷰를 쌓는다.
 */

/*
 23.01.17 (수) 2주차 스터디
 
 NavigationLink(value)
 - 스터디원은 이렇게도 사용함
 
 NavigationPath
 - rootView로 돌아갈 때 사용
 - 같은 타입의 모델을 쓰는 뷰가 다수일 때 사용. 열거형에서 연관값으로 모델을 받아 뷰를 리턴해서 써야함. 안그러면 해당 화면이 안 뜬다
 
 @EnvironmentObject
 - 모든 뷰에서 접근할 수 있는 요소에 붙이는 키워드. 싱글톤 비슷한 듯
 
 NavigationPathFinder
 ObservableObject
 @Published
 - 앞으로 공부할 키워드들
 
 LazyVStack
 - 100개 데이터를 모두 표시할 필요 없이 화면에 보이는 셀만 표시할 때 사용하는 것과 같은 원리
 
 AsyncImage
 - 얼마전 회사에서 직접 구현했는데 스유는 기본으로 지원해준다. 편함
 
 Text + Text도 가능!!
 */

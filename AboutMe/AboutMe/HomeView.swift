//
//  HomeView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct HomeView: View {
    /// GeometryReader
    /// - 상위 뷰 크기에 대비하여 하위 뷰 레이아웃(위치, 크기)을 짜고 싶을 때 쓰는 듯
    /// - VStack, HStack, ZStack 공부할 때 같이 살펴보기
    var body: some View {
        VStack {
            Text("All About")
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .background(.yellow)
                .padding()
                .background(.pink)
            
            Image(information.image)
                .resizable()
                //.cornerRadius(10)   // deprecated 예정이므로 아래 코드를 대신 사용하자
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(contentMode: .fit)
                //.scaledToFit()      // 이런 것도 있음
                .padding(40)
            
            Text(information.name)
                .font(.title)
        }
    }
    
}

#Preview {
    HomeView()
}

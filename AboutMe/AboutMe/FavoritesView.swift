//
//  FavoritesView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        VStack {
            // 타이틀
            Text("Favorites")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 40)
            
            // 서브타이틀1
            Text("Hobbies")
                .font(.title)  // 타이틀(대)
            
            HStack {
                ForEach(information.hobbies, id: \.self) {
                    Image(systemName: $0)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 80, maxHeight: 60)
                }
                .padding()
            }
            .background(.mint)
            .padding()
            .background(.gray)
            
            // 서브타이틀2
            Text("Foods")
                .font(.title2)  // 타이틀(중)
                .padding(.top)
            
            HStack(spacing: 60) {
                // os-development.tistory.com
                ForEach(information.foods, id: \.self) {
                    Text($0)
                        .font(.system(size: 48))
                }
            }
            .background(.mint)
            .padding()
            
            // 서브타이틀3
            Text("Favorite Colors")
                .font(.title3)  // 타이틀(소)
            
            HStack(spacing: 30) {
                ForEach(information.colors, id: \.self) {
                    $0.frame(maxWidth: 70, maxHeight: 70)
                        .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.mint)
            .padding(.top)
        }
    }
    
}

#Preview {
    FavoritesView()
}

//
//  GridItemView.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import SwiftUI

struct GridItemView: View {
    let item: Item
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: item.url) {
            $0.resizable()
              .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)   // 지우면 ImageGrid에서 이미지 로딩할 때 뜨는 인디케이터가 아이템(각 이미지) 좌측 상단에 뜸
    }
}

#Preview {
    GridItemView(item: Item(url: Bundle.main.url(forResource: "bobcat", withExtension: "jpg")!), size: 50)
}

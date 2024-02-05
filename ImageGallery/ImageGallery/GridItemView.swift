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
            image in
            image.resizable()
            image.scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    GridItemView(item: Item(url: Bundle.main.url(forResource: "bobcat", withExtension: "jpg")!), size: 50)
}

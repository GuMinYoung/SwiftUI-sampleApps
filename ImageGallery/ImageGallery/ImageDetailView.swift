//
//  ImageDetailView.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import Foundation
import SwiftUI

struct ImageDetailView: View {
    let item: Item
    
    var body: some View {
        AsyncImage(url: item.url) {
            $0.resizable()
              .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ImageDetailView(item: Item(url: Bundle.main.url(forResource: "bobcat", withExtension: "jpg")!))
}

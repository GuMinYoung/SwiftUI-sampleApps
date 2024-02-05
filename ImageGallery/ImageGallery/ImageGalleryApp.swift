//
//  ImageGalleryApp.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import SwiftUI

@main
struct ImageGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ImageGrid()
            }
        }
    }
}


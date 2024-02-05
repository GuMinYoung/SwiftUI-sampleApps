//
//  ImageGalleryApp.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import SwiftUI

@main
struct ImageGalleryApp: App {
    /*
     SwiftUI/EnvironmentObject.swift:90: Fatal error: No ObservableObject of type DataModel found. A View.environmentObject(_:) for DataModel may be missing as an ancestor of this view.
     */
    @StateObject var data = DataModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ImageGrid()
            }.environmentObject(data)
        }
    }
}


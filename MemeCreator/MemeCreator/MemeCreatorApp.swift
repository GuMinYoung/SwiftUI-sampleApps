//
//  MemeCreatorApp.swift
//  MemeCreator
//
//  Created by 구민영 on 2/12/24.
//

import SwiftUI

@main
struct MemeCreatorApp: App {
    @StateObject private var fetcher = ImageFetcher()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MemeCreator()
                    .environmentObject(fetcher)
            }
        }
    }
}

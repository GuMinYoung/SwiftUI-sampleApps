//
//  ImageFetcher.swift
//  MemeCreator
//
//  Created by 구민영 on 2/12/24.
//

import SwiftUI

class ImageFetcher: ObservableObject {
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
     func fetchData() async throws {
        guard let url = URL(string: urlString) else { return }

        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

        Task { @MainActor in
            imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
        }
    }
}

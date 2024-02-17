//
//  LoadableImage.swift
//  MemeCreator
//
//  Created by 구민영 on 2/12/24.
//

import SwiftUI

struct LoadableImage: View {
    var imageMetadata: Panda
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetadata.description))
            }  else if phase.error != nil  {
                VStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("The pandas were all busy.")
                        .font(.title2)
                    Text("Please try again.")
                        .font(.title3)
                }
                
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadableImage(imageMetadata: Panda.defaultPanda)
}

//
//  ContentView.swift
//  MemeCreator
//
//  Created by 구민영 on 2/12/24.
//

import SwiftUI

struct TextInfo {
    var content: String
    var size: CGFloat
    var color: Color
}

struct MemeCreator: View {
    @EnvironmentObject var fetcher: ImageFetcher
    @State private var text = TextInfo(content: "", size: 60, color: .black)
    @State private var isProgressViewShown = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                if isProgressViewShown {
                    ProgressView()
                }
                LoadableImage(isLoading: $isProgressViewShown, imageMetadata: fetcher.currentPanda)
                
                TextField("meme", text: $text.content, prompt: Text("input text"))
                    .focused($isFocused)
                    .font(.system(size: text.size, weight: .heavy))
                    .foregroundStyle(Color(text.color))
                    .multilineTextAlignment(.center)
            }
            
            if !text.content.isEmpty {
                VStack {
                    HStack {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $text.color)
                            .labelsHidden()
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $text.size, in: 20...140)
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
            }
            
            HStack {
                Button {
                    isProgressViewShown = true
                    if let image = fetcher.imageData.sample.randomElement() {
                        fetcher.currentPanda = image
                    }
                } label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding([.bottom], 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Button {
                    isFocused = true
                } label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding([.bottom], 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
            }
            .padding()
            .fixedSize(horizontal: false, vertical: true)
            //.frame(maxHeight: 180, alignment: .center)
            
        }
        .task {
            do {
                try await fetcher.fetchData()
            } catch {
                print(error)
            }
        }
        .navigationTitle("Meme Creator")
    }
}

#Preview {
    MemeCreator().environmentObject(ImageFetcher())
}

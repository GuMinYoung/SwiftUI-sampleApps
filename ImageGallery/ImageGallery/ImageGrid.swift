//
//  ImageGrid.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import SwiftUI

struct ImageGrid: View {
    @State private var data = DataModel()
    @State private var selectedImage: Item?
    
    private static let initialColumnCount = 3
    @State private var isAddingImage = false
    @State private var isEditing = false
    @State private var gridItems = Array(repeating: GridItem(.flexible()), count: initialColumnCount)
    @State private var columnCount: Int = initialColumnCount
    
    private var stepperTitle: String {
        let base = "\(columnCount) "
        return columnCount > 1 ? base + "Columns" : base + "Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                Stepper(stepperTitle, value: $columnCount, in: 1...8) {_ in
                    withAnimation {
                        gridItems = initGridItems(count: columnCount)
                    }
                }
                .padding()
            }
            
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(data.items) { item in
                        NavigationLink(destination: ImageDetailView(item: item)) {
                            ZStack(alignment: .topTrailing) {
                                //GeometryReader { geo in ImageDetailView(item: item)) {
                                GridItemView(item: item, size: 110)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .aspectRatio(1, contentMode: .fit)
                                
                                if isEditing {
                                    Button {
                                        withAnimation {data.remove(item)
                                        }
                                    } label: {
                                        Image(systemName: "xmark.square.fill")
                                            .font(.system(size: 25))
                                            .foregroundStyle(.white, .red)
                                            .padding(.top, -7)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingImage, onDismiss: addImage) {
            ImagePicker(isShowSheet: $isAddingImage)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAddingImage = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
    
    func initGridItems(count :Int) -> [GridItem] {
        return Array(repeating: GridItem(.flexible()), count: count)
    }
    
    func addImage() {
        guard let item = selectedImage else { return }
        withAnimation {
            data.insert(item)
        }
    }
}

#Preview {
    ImageGrid()
}

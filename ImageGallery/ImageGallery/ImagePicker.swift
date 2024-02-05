//
//  ImagePicker.swift
//  ImageGallery
//
//  Created by 구 민영 on 2024/02/04.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    @EnvironmentObject var data: DataModel
    
//    /// A dismiss action provided by the environment. This may be called to dismiss this view controller.
//    @Environment(\.dismiss) var dismiss
    
    // @State와 @Binding을 사용해서 view를 닫는 방법
    @Binding var isShowSheet : Bool
    
    /// Creates the picker view controller that this object represents.
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> PHPickerViewController {
        
        // Configure the picker.
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        // Limit to images.
        configuration.filter = .images
        // Avoid transcoding, if possible.
        configuration.preferredAssetRepresentationMode = .current

        let photoPickerViewController = PHPickerViewController(configuration: configuration)
        photoPickerViewController.delegate = context.coordinator
        return photoPickerViewController
    }
    
    /// Creates the coordinator that allows the picker to communicate back to this object.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    /// Updates the picker while it’s being presented.
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // No updates are necessary.
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    let parent: ImagePicker
    
    /// Called when one or more items have been picked, or when the picker has been canceled.
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // Dismisss the presented picker.
        self.parent.isShowSheet.toggle()
        
        guard
            let result = results.first
                , result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier)
        else { return }
        
        // Load a file representation of the picked item.
        // This creates a temporary file which is then copied to the app’s document directory for persistent storage.
        result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
            if let error = error {
                print("Error loading file representation: \(error.localizedDescription)")
            } else if let url = url {
                if let savedUrl = FileManager.default.copyItemToDocumentDirectory(from: url) {
                    // Add the new item to the data model.
                    Task { @MainActor [dataModel = self.parent.data] in
                        withAnimation {
                            let item = Item(url: savedUrl)
                            dataModel.insert(item)
                        }
                    }
                }
            }
        }
    }
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
}

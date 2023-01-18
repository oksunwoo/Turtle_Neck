//
//  ImagePicker.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/28.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    let sourceType: UIImagePickerController.SourceType
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        let sourceType: UIImagePickerController.SourceType
        
        init(_ parent: ImagePicker, sourceType: UIImagePickerController.SourceType) {
            self.parent = parent
            self.sourceType = sourceType
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            if sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
            }
            self.parent.image = image
            self.parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self, sourceType: sourceType)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

//
//  ImagePicker.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/14.
//

import SwiftUI

struct ImagePicker :UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var pickImage: UIImage?
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
      return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
    class Coordintor: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker

        init(_ parent: ImagePicker){
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage{
                parent.pickImage = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordintor {
        Coordintor(self)
    }
}

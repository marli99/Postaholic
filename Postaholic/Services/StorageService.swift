//
//  StorageService.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/20.
//

import Foundation
import Firebase
import FirebaseStorage

class StorageService{
    
    
    static var storage = Storage.storage()
    static var storageRoot = storage.reference()
    static var storagePost = storageRoot.child("posts")
    
    static func savePost(caption: String, image: UIImage, onSuccess: @escaping()-> Void, onError: @escaping(_ errorMessage: String)-> Void){
        
        let fileName = storagePost.child(Data().description)
        
        if let imageData = image.jpegData(compressionQuality: 1){
            fileName.putData(imageData, metadata: nil){
                (_, error) in
                
                if let error = error{
                    print("Error: \(error.localizedDescription)")
                    onError(error.localizedDescription)
                    return
                }
                
                fileName.downloadURL{ (url, error) in
                    if let error = error {
                    print("Error: \(error.localizedDescription)")
                    onError(error.localizedDescription)
                    return
                }
                    if let metaDataUrl = url?.absoluteString{
                        print("IMSGE!!!!!")
                        
                        FireStoreService.addNewPost(caption: caption, imageUrl: metaDataUrl)
                        onSuccess()
                        return
                    }
                }
            }
        } else {
            onError("Could not decode the image")
            return
        }
    }

}

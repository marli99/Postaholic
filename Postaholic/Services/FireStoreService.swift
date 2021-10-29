//
//  FireStoreService.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseFirestore


class FireStoreService: ObservableObject {
    static var db = Firestore.firestore()
    
    
    static func addNewUser(uid: String, username: String, email: String){
        
        db.collection("users").document(uid).setData([
            "username": username,
            "email": email
        ]){error in
            if let error = error {
                print("Error writing document; \(error)")
            }else{
                print("Document added succssfully")
            }
        }
    }
    
    
    static func addNewPost(caption: String, imageUrl: String) {
        
        db.collection("posts").document().setData([
            "caption": caption,
            "imageUrl": imageUrl,
            "ownerId": Auth.auth().currentUser!.uid,
            "likeCOunt": 0,
            "date": Date().timeIntervalSince1970
        ]) { error in
            if let error = error {
                print("Error waiting for document: \(error)")
            }else {
                print("Document added succesfully")
                
                
            }
            
        }
        
        
    }
    
    
    
    @Published var posts = [Post]()
    
    func fetchAllPosts(){
        
        FireStoreService.db.collection("posts").getDocuments{
            (querySnapshot, error) in
            if let error = error {
                print(error)
                return
            } else {
                self.posts = querySnapshot!.documents.map{ (queryDocument) -> Post in
                                                
                let document = queryDocument.data()
                
                let caption = document["caption"] as? String ?? "No caption"
                let ownerId = document["ownerID"] as? String ?? "No user"
                let imageUrl = document["imageUrl"] as? String ?? ""
                let likeCount = document["likeCuunt"] as? Int ?? 0
                let date = document["date"] as? Double ?? 0
                    
                    return Post(postId: queryDocument.documentID, caption: caption, imageUrl: imageUrl, ownderId: ownerId, likeCount: likeCount, date: date)
                                                            
                                                             
                                                             
                                                         
                }
            }
        }
           
    }
}

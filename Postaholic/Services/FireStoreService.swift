//
//  FireStoreService.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseFirestore

class FireStoreService{
    
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
}

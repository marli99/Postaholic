//
//  AuthService.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService{
    
    static var auth = Auth.auth()
    
    static func signUp(username: String, email: String, password: String, onSuccess: @escaping (_ user: String) ->
    Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        auth.createUser(withEmail: email, password: password){
            (authData, error) in
            
            if(error != nil){
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else{return}
            
            FireStoreService.addNewUser(uid: userId, username: username, email: email)
            onSuccess(userId)
            
        }
            
    }
}

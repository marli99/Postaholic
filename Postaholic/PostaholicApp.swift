//
//  PostaholicApp.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/09/23.
//

import SwiftUI
import Firebase

@main
struct PostaholicApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("userId") var userId: String = ""
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    
    var body: some Scene {
        WindowGroup {
            if userId.isEmpty{
                AuthScreenView()
            }else{
                ContentView()
            }
            
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate{
    //syart typing didFinish and select second suggestion
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
        print("Firebase...")
        FirebaseApp.configure()
        
        return true
    }
        
}

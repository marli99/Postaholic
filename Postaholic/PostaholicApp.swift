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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
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

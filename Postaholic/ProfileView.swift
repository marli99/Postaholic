//
//  ProfileView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/27.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       
        Button(action: {
            AuthService.signOut()
        }, label: {
            Text("Sign Out")
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

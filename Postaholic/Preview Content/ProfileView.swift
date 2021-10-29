//
//  ProfileView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/29.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack{
            Image("Image-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

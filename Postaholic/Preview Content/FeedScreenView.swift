//
//  FeedScreenView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/21.
//

import SwiftUI

struct FeedScreenView: View {
    
    @ObservedObject var viewModel = FireStoreService()
    @State var navigate = false
    
    var body: some View {
       
        NavigationView{
            
            ScrollView{
                ForEach(viewModel.posts){ post in
                    PostView(post: post)
                    
                }
                
            }
            .navigationBarItems(leading: Text("Discover"), trailing: NavigationLink(
            
                                    destination:CreatePostScreenView(),
                                    isActive: $navigate,
                                    label: {
                                        Image(systemName: "plus.square.fill.on.square.fill")
                                    }))
        }
        .onAppear(perform: {
            viewModel.fetchAllPosts()
        })
        .onOpenURL(perform: { url in
            navigate = true
        })
    }
}

struct FeedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreenView()
    }
}

//
//  ProfileView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/27.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = FireStoreService()
    
    @State var caption: String = "What is on your mind."
    
    @State var uploadOptions = false
    
    
    var body: some View {
        NavigationView{
        VStack{
    
            Image("Image-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            HStack{
            
            Text("Followers   20")
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                .padding()
            
            Button(action: {
                AuthService.signOut()
            }, label: {
                Text("Sign Out")
            }).padding()
        }
            
            HStack{
            
                Text("Name:")
        
                    
                
            Text("MARLI CORREIA")
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            }.padding()
            
            HStack{
            
                Text("Email:")
        
            Text("marlicorreia99@gmail.om")
                
                
            }.padding()
            
                        HStack{
                            Text("Post Made")
                                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                            ScrollView{
                                NavigationLink(
                                    destination:CreatePostScreenView(showingImagePicker:
                                        uploadOptions),
                                    label: {
                                    Image(systemName: "camera")
                                        .accentColor(.white)
                                        .padding()
                                        })
                                if viewModel.posts.count < 1 {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                }else{
                                    ForEach(viewModel.posts){ post in
                                        PostView(post: post)
                                    }
                                }
                                

                            }
                        }

                            .onAppear(perform: {
                                viewModel.fetchAllPosts()
                            })
            
        }
            
        }.padding()
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
                       
    }
}

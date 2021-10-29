//
//  ContentView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FireStoreService()
    
    @State var caption: String = "What is on your mind."
    
    @State var uploadOptions = false
    
//    @State var isLoading = true
    
    var body: some View {
        NavigationView{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                LinearGradient(gradient: Gradient(colors: [
                    Color("BlueNew"),
                    Color("PinkNew")
                ]), startPoint: .topLeading, endPoint: .bottomLeading)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
               
                
                
                
            ScrollView{
                VStack(alignment: .trailing, spacing: 30){
                    
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            Image("Image-2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                
                              
                        })
               
                
                ScrollView(.horizontal, showsIndicators: false){
                HStack{
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                        
                        Image("Image-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    
                    
                    }
                }
           
                
                
             
                TextEditor(text: $caption)
                       
                        .padding()
                        .frame(width: 360, height: 90, alignment: .trailing)
                        .background(Color.white).cornerRadius(25.0)
                
                    
        
                    HStack{
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
                    
                    .onOpenURL(perform: { url in
                        print("=======URL Opened: \(url)")
                        
                        if "\(url)" == "widget://upload"{
                            uploadOptions = true
                        }
                    })
                    }
            }.padding(15)
                
                
                
                    
                }
                
            }
            
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


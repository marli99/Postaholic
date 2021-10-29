//
//  PostView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/21.
//

import SwiftUI

extension String{
    
    func loadImage() -> UIImage{
        do{
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }catch {
            return UIImage()
        }
    }
}

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text(post.ownderId)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action:{
                    print("edit")
                }, label:{
                    Image(systemName: "highlighter")
                                  
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                       
                    
                })
      
                
                
            }
            Image(uiImage: "\(post.imageUrl)" .loadImage())
                .resizable()
                
                .scaledToFit()
            
            Text(post.caption)
                . multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
      
                .foregroundColor(.white)
            
            HStack{
                Image(systemName: "heart")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
                
                Text("\(post.likeCount)")
                    .padding(.top, 2)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Text("\(NSDate(timeIntervalSince1970: post.date))")
                    .padding(.top, 4)
                    .foregroundColor(.white)
            }
            
        }.padding()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(postId: "1", caption: "caption", imageUrl: "https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/Independence-Lake-Clean-Drinking-Water_4000x2200.jpg", ownderId: "1", likeCount: 0, date: 0))
            .previewLayout(.sizeThatFits)
    }
}

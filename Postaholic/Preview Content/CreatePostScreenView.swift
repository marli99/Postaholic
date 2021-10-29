//
//  CreatePostScreenView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/14.
//

import SwiftUI

struct CreatePostScreenView: View {
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oops!"
    
    @State var caption: String = "Your Caption..."
    @State var pickImage: UIImage?
    @State var displayImage: Image?
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
   
    
        

    
    
    func loadImage(){
        guard let inputImage = pickImage else{return}
        pickImage = inputImage
        displayImage = Image (uiImage: inputImage)
    }
    
    @State var showingActionsheet = false
    
    func clear(){
        self.displayImage = nil
        self.caption = ""
    }
    
    func errorCheck() -> String? {
        if caption.trimmingCharacters(in: .whitespaces).isEmpty || pickImage == nil{
            return "Please upload an image with a caption"
        }
        return nil
    }
    
    
    func uploadImage() {
        if let error = errorCheck(){
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        StorageService.savePost(caption: self.caption, image: self.pickImage!, onSuccess: {
            self.clear()
        }){
            (errorMessage) in
            self.errorMessage = errorMessage
            self.showingAlert = true
        }
    
    }
    
    
    var body: some View {
        VStack(spacing: 20){
            Text("Create a Post")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            if displayImage != nil{
                displayImage!.resizable()
                    .frame(width: 250, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onTapGesture(perform: {
                        self.showingActionsheet = true
                    })
            }else{
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onTapGesture(perform: {
                        self.showingActionsheet = true
                    })
            }
            
            TextEditor(text: $caption)
               
                .padding()
                .frame(width: 370, height: 330, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.black))
            
            Button(action: {
                uploadImage()
                print("clicked  button")
         
            }, label:{
                Text("POST")
                    .font(.system(size: 15))
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color(.black))
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try again")))
            })
        
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(pickImage: $pickImage)
        }.actionSheet(isPresented: $showingActionsheet){
            ActionSheet(title: Text(""), buttons:[
                            .default(Text("Upload Image")){
                                self.showingImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Take a picture")){
                                self.showingImagePicker = true
                                self.sourceType = .camera
                            },
                .cancel()
            ])
        }
    }
}

struct CreatePostScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostScreenView()
    }
}

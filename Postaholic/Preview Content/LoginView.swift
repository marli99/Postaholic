//
//  LoginView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("userId") var userId: String = ""
    
    @State private var emailVal: String = ""
    @State private var passwordVal: String = ""
    
    @State var isLoading: Bool = true
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "NOOOO"
    
    func errorCheck() -> String?{
        if emailVal.trimmingCharacters(in: .whitespaces).isEmpty ||
            passwordVal.trimmingCharacters(in: .whitespaces).isEmpty {
            return  "Please fill in all of the required fields"
          
        }
        return nil
    }
        
        func login(){
            if let error = errorCheck(){
                self.errorMessage = error
                self.showingAlert = true
                return
            }
            
            AuthService.signIn(email: emailVal, password: passwordVal, onSuccess: {(uid) in
            print("Firebase Auth ID: \(uid)")
                userId = uid
            return
        }, onError: {(error) in
            self.errorMessage = error
            self.showingAlert = true
            return
        })
    }

    
    var body: some View {
        ZStack{
//            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple
//            ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).ignoresSafeArea(.all)
//                   
            VStack(alignment: .center, spacing: 30){
                Image("IOSLOGO")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                 
                    
                    Text("Postaholic")
                        .foregroundColor(.white)
                      
                    
                    Text("LOGIN")
        
                        .foregroundColor(.black)
                   
                
                HStack{
                    Image(systemName: "envelope")
                        .padding(.leading,10)
                    TextField("Email", text: $emailVal)
                        .padding()
                        .font(.system(size: 20))
                      
                        
                }
                
      
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .background(Color.white.opacity(0.5).cornerRadius(10.0))
                
                
                HStack{
                    Image(systemName: "lock")
                        .padding(.leading, 10)
                    SecureField("Password", text: $passwordVal)
                        .padding()
                        .font(.system(size: 20))
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .padding(.top,5)
                .padding(.leading,6)
                .cornerRadius(10.0)
                .background(Color.white.opacity(0.5).cornerRadius(10.0))
                
                
                
                Button(action: {
                   print("clicked login button")
                    login()
                }, label:{
                    Text("Login")
                        .font(.system(size: 20))
                        .frame(width: 80, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                })
                .background(Color(.white))
                .foregroundColor(.black)
                .cornerRadius(10.0)
                .padding(.leading, 130)
                .padding(.bottom,100)
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try again")))
                })
            
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        
        }
        
        
      
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

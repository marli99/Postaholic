//
//  LoginView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import SwiftUI

struct LoginView: View {
    @State private var emailVal: String = ""
    @State private var passwordVal: String = ""
    
    
//    @State var showRegister: Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple
            ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).ignoresSafeArea(.all)
                   
            VStack(alignment: .leading, spacing: 30){
                Image("IOSLOGO")
                    .resizable()
                    .frame(width: 170, height: 230, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 100)
                    .padding(.top, 30)
                    
                    Text("Postaholic")
                        .padding(.leading, 130)
                      
                    
                    Text("LOGIN")
                        .padding(.leading, 150)
                   
                
                HStack{
                    Image(systemName: "envelope")
                        .padding(.leading,10)
                    TextField("Email", text: $emailVal)
                        .padding()
                        .font(.system(size: 20))
                      
                        
                }
                
                .foregroundColor(.white)
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
//                    showRegister = false
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
                
                HStack{
                    Text("Do not have an Account")
                        .font(.system(size: 10))
                    Button(action: {
//                        showRegister = true
                    }, label:{
                        Text("Sign Up")
                            .font(.system(size: 10))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                           
                    })
//                    showRegister ? RegisterView() : nil
                }
                .padding(.leading, 100)
                
                .padding(.bottom, 130)
                
            }
            
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    
        }
        
    }
    
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

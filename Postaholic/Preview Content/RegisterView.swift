//
//  RegisterView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import SwiftUI

struct RegisterView: View {
    @State private var SignupUserVal: String = ""
    @State private var SignupEmailVal: String = ""
    @State private var SignupPasswordVal: String = ""
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "NOOOO"
    
    func errorCheck(){
        if SignupUserVal.trimmingCharacters(in: .whitespaces).isEmpty ||
            SignupEmailVal.trimmingCharacters(in: .whitespaces).isEmpty ||
            SignupPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty
        {
            self.errorMessage = "Please fill in all of the required fields"
            self.showingAlert = true
        }
    }
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple
            ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Image("IOSLOGO")
                    .resizable()
                    .frame(width: 170, height: 230, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                   
           
                    
                    Text("Postaholic")
                        .padding()
                      
                    
                    Text("SIGN UP")
                   
                
                HStack{
                    Image(systemName: "person")
                        .padding(.leading,10)
                    TextField("Username", text: $SignupUserVal)
                        .padding()
                        .font(.system(size: 20))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(true)
                }
                .cornerRadius(10.0)
                .background(Color("greyBackground"))
                
                HStack{
                    Image(systemName: "lock")
                        .padding(.leading, 10)
                    SecureField("Email", text: $SignupEmailVal)
                        
                        .padding()
                        .font(.system(size: 20))
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .cornerRadius(10.0)
                .background(Color("white"))
                
                
                HStack{
                    Image(systemName: "lock")
                        .padding(.leading, 10)
                    SecureField("Password", text: $SignupPasswordVal)
                        .padding()
                        .font(.system(size: 20))
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .cornerRadius(10.0)
                .background(Color("white"))
                
                
                
                Button(action: {
                    print("clicked SignUp button")
                }, label:{
                    Text("Sign Up")
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .background(Color(.white))
                .foregroundColor(.black)
                .cornerRadius(10.0)
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try again")))
                })

//
                HStack{
                    Text("Already have an Account")
                        .font(.system(size: 10))
                    Button(action: {
                        
                    }, label:{
                        Text("Login")
                            .font(.system(size: 10))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                           
                    })
                }
                .padding(.bottom, 80)
            }
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
    
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

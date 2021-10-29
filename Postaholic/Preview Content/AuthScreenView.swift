//
//  AuthScreenView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import SwiftUI

struct AuthScreenView: View {
    
    @State var showRegister: Bool = false
    
    var body: some View {
        
        ZStack{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple
                ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .clipShape(CShape())
                
                Path{ path in
                    path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 130, y: UIScreen.main.bounds.height - 45), radius: 40, startAngle: .zero,endAngle: .init(degrees: 180), clockwise: true)
                    
                }
                .fill(Color.white)
                
                Button(action: {
                    showRegister = false
                }, label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                }).offset(x: -37, y:-30)
                
                Button(action: {
                    showRegister = true
                }, label: {
                    Image(systemName: "person.badge.plus.fill")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                }).offset(x: -115, y:-50)
                
            }
            .offset(y: showRegister ?
                -UIScreen.main.bounds.height + 130 : 0)
            showRegister ? nil : LoginView()
            showRegister ? RegisterView() : nil
        }
        .ignoresSafeArea(.all)
        .statusBar(hidden: true)
        .background(Color.white)
        
    }
   
}

struct AuthScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthScreenView()
        }
    }
}

struct CShape: Shape{
    func path(in rect: CGRect) -> Path{

        return Path{path in

            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y:rect.height - 50))
           


            path.addArc(center: CGPoint(x: rect.width - 50, y: rect.height - 50), radius: 40, startAngle: .zero,endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}

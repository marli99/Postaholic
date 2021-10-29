//
//  SplashScreenView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/07.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [
                Color("BlueNew"),
                Color("PinkNew")
            ]), startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center, spacing: 30){
                
            Image("IOSLOGO")
                .resizable()
                .frame(width: 300, height: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
            
                Text("Welcome to")
                    .font(Font.custom("helvetica-light-587ebe5a59211", size: 28))
                    .padding()
                Text("Postaholic")
                    .font(Font.custom("DancingScript-VariableFont_wght", size: 25))
                    .padding()
       
            }
            .foregroundColor(.white)
        }

    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

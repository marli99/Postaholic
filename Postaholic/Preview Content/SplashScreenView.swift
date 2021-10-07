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
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple
            ]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center, spacing: 30){
                
            Image("IOSLOGO")
                .resizable()
                .frame(width: 300, height: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
            
                Text("Welcome to")
                    .padding()
                Text("Postaholic")
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

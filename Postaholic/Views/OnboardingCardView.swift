//
//  OnboardingCardView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/08.
//

import SwiftUI

//
//  OnboardingCardView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/08.
//

import Foundation

struct OnboardingCardView: View {
    
    var image: String
    var title: String
    var description: String
    var body: some View {
        ZStack{
            Image(image)
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 890, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack{
            Text(title)
                .foregroundColor(.white)
                
                .padding()
                
            Text(description)
                .frame(width: 250, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
                BttonskipView()
                
                
            }
        }
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
            
            OnboardingCardView(image: "78908", title: "Welcome to Techno Box", description: "Techno Box is a mobile library application, for all you technoloy craving")
                .previewLayout(.fixed(width: 320, height: 640))
    }
}



//
//  OnboardingView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/08.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            OnboardingCardView(image: "Image", title: "Welcome to Postaholic", description: "Description")
            
            OnboardingCardView(image: "Image-1", title: "How it works", description: "Description")
            
            OnboardingCardView(image: "Image-2", title: "How it works", description: "Description")
        }
        .tabViewStyle(PageTabViewStyle())
//        .ignoresSafeArea()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

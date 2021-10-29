//
//  StartButtonView.swift
//  TechVintory
//
//  Created by Marli Correia on 2021/08/11.
//

import SwiftUI

struct StartButtonView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @AppStorage("isRegister") var isRegister: Bool?
    
    var body: some View{
        Button(action: {
            isRegister = true
        }, label: {
            HStack{
            Text("SKIP")
            
            Image(systemName: "arrow.right.circle")
                .imageScale(.large)
            }
            
                .padding(.vertical,10)
                .padding(.horizontal,16)
                .background(Capsule()
                .strokeBorder(Color.white, lineWidth: 1.35))
                .accentColor(.white)
        })
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
    }
}

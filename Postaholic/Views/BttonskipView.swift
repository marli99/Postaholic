//
//  BttonskipView.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/29.
//

import SwiftUI

struct BttonskipView: View {
    var body: some View {
   
            
        NavigationLink(
            destination: ContentView(),
               label:{
                Text("Skip")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                
           })
        
            .padding(.vertical,10)
            .padding(.horizontal,16)
            .background(Capsule()
            .strokeBorder(Color.white, lineWidth: 1.35))
            .accentColor(.white)
        
        
        
    }
}

struct BttonskipView_Previews: PreviewProvider {
    static var previews: some View {
        BttonskipView()
    }
}

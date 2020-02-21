//
//  ContentView.swift
//  Business Card
//
//  Created by Felipe on 19-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("yo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5.0))
                
                Text("Felipe Mardones")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                
                InfoView(text: "+569 97621 90 06", imageName: "phone.fill")
                InfoView(text: "felipe@growdigital.cl", imageName: "envelope.fill")

                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


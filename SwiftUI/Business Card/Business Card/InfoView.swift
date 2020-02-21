//
//  InfoView.swift
//  Business Card
//
//  Created by Felipe on 19-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
                .foregroundColor(Color("FontColor"))
            })
            .padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "+569 9 7621 90 06", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}

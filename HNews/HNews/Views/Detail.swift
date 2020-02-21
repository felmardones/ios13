//
//  Detail.swift
//  HNews
//
//  Created by Felipe on 20-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import SwiftUI

struct Detail: View {
    
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(url: "https://www.google.com")
    }
}



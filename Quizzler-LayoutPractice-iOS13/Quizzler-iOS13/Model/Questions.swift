//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Felipe on 20-01-20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Questions{
    let text : String
    let answer : String
    
    init(q: String, a: String) {
        self.text   = q
        self.answer     = a
    }
 
}

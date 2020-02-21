//
//  PostData.swift
//  HNews
//
//  Created by Felipe on 20-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}


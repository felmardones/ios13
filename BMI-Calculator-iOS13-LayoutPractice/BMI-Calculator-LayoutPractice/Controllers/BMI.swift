//
//  BMI.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Felipe on 05-02-20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
enum Advice:String{
    case skinny = "Try to eat more"
    case normal = "You're good"
    case overweight = "Don't eat!"
}

struct BMI{
    var value: String?
    var advice: Advice?
    var color: UIColor?
}

//
//  CalculateBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Felipe on 05-02-20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    init(bmi : BMI?) {
        self.bmi    = bmi
    }
    
    public mutating func calculateBmi(height: Float, weight: Float) -> String{
        self.bmi?.value = String(format: "%.1f",weight/pow(height, 2))
        return String(format: "%.1f",weight/pow(height, 2))
    }
    

    mutating func getAdvice() -> String?{
        guard let value = self.bmi?.value else {
            print("bad")
            return nil
            
        }
        let valFloat: Float = Float(value)!
        switch valFloat {
        case 0...18.5:
            self.bmi?.advice = .skinny
        case 18.6...29.6:
            self.bmi?.advice = .normal
        case 29.6...:
            self.bmi?.advice = .overweight
        default:

            self.bmi?.advice = nil
        }
        return self.bmi?.advice?.rawValue
    }
    
    func getColor() -> UIColor?{
        var color: UIColor
        switch self.bmi?.advice {
        case .skinny:
            color   = UIColor.systemGreen
        case .normal:
            color   = UIColor.systemBlue
        case .overweight:
            color   = UIColor.systemTeal
        case .none:
            color   = UIColor.white
        }
        return color
        
    }
}

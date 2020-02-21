//
//  WeatherModel.swift
//  Clima
//
//  Created by Felipe on 10-02-20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
enum WeatherCondition: CaseIterable{
    case bolt
    case drizzle
    case snow
    case rain
    case fog
    case max
    
    var name:String {
        switch self{
        case .bolt:
            return "cloud.bolt"
        case .drizzle:
            return "cloud.drizzle"
        case .snow:
            return "cloud.snow"
        case .rain:
            return "cloud.rain"
        case .fog:
            return "cloud.fog"
        case .max:
            return "sun.max"
        }
    }
    
    var index: Int {
        switch self {
        case .bolt:
            return 1
        case .drizzle:
            return 2
        case .snow:
            return 3
        case .rain:
            return 4
        case .fog:
            return 5
        case .max:
            return 6
        }
    }
}

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    var conditionName: String{
        
        switch conditionId {
        case 200...232:
            return WeatherCondition.bolt.name
        case 300...321:
            return WeatherCondition.drizzle.name
        case 500...531:
            return WeatherCondition.rain.name
        case 600...622:
            return WeatherCondition.snow.name
        case 701...781:
            return WeatherCondition.fog.name
        case 800:
            return WeatherCondition.max.name
        case 801...804:
            return WeatherCondition.bolt.name
        default:
            return "cloud"
        }
        
    }
    
}

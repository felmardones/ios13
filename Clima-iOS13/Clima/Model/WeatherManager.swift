//
//  WeatherManager.swift
//  Clima
//
//  Created by Felipe on 10-02-20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    
    let weatherURL  =   "https://api.openweathermap.org/data/2.5/weather?appid=9a6424c14e797ca9703c3f7bba592689&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString   = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: Double, longitude: Double){
        let urlString   = "\(weatherURL)&lon=\(longitude)&lat=\(latitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task    = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodeData = try  decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

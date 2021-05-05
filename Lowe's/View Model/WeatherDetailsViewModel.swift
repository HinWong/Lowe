//
//  WeatherDetailsViewModel.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import Foundation

class WeatherDetailsViewModel {
    let weather: [Weather]
    let city: City
    let main: Main

    init(weather: [Weather], city: City, main: Main) {
        self.weather = weather
        self.city = city
        self.main = main
    }
    
    func cityName() -> String {
        self.city.name
    }
    
    func weatherType() -> String {
        self.weather.first?.main ?? ""
    }
    
    func weatherDescrption() -> String {
        self.weather.first?.weatherDescription ?? ""
    }
    
    func temperature() -> String {
        String(convertToFarenheit(tempInK: main.temp))
    }
    
    func feelsLike() -> String {
        "Feels like: \(convertToFarenheit(tempInK: main.feelsLike))"
    }
    
    func convertToFarenheit(tempInK: Double) -> Int {
        let tempInCelcius = tempInK - 273.0
        let tempInF = (tempInCelcius * 9.0 / 5.0) + 32
        return Int(tempInF.rounded())
    }
}

//
//  ConditionsViewModel.swift
//  Lowe's
//
//  Created by Hin Wong on 4/29/21.
//

import Foundation

class ConditionsViewModel {
    private let weatherConditions: CityWeatherResponse
    
    init(weatherResponse: CityWeatherResponse) {
        self.weatherConditions = weatherResponse
    }
    
    func getCity() -> City {
        weatherConditions.city
    }
    
    func getCityName() -> String {
        weatherConditions.city.name
    }
    
    func getNumberOfTemperatures() -> Int {
        weatherConditions.list.count
    }
    
    func getWeathersAt(indexPath: IndexPath) -> [Weather] {
        self.weatherConditions.list[indexPath.row].weather
    }
    
    func getMainAt(indexPath: IndexPath) -> Main {
        self.weatherConditions.list[indexPath.row].main
    }
    
    func tempConversion(kelvins: Double) -> Int {
        let celsius = kelvins - 273
        let farenheit = (celsius * 9/5) + 32
        return Int(farenheit.rounded())
    }
    
    func getWeatherViewModel(indexPath: IndexPath) -> ConditionCellViewModel {
        let condition = weatherConditions.list[indexPath.row].weather.first?.main ?? ""
        let temperature = weatherConditions.list[indexPath.row].main.temp
        let farenheit = tempConversion(kelvins: temperature)
        return ConditionCellViewModel(condition: condition, temperature: farenheit)
    }

}

class ConditionCellViewModel {
    let condition: String?
    let temperature: String?
    
    init(condition: String, temperature: Int) {
        self.condition = condition
        self.temperature = String(temperature) + "℉"
    }
}

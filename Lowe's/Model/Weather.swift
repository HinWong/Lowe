//
//  Weather.swift
//  Lowe's
//
//  Created by Hin Wong on 4/29/21.
//

import Foundation

struct CityWeatherResponse: Codable {
    let list: [List]
    let city: City
}

// MARK: - List
struct List: Codable {
    let dt: Double
    let main: Main
    let weather: [Weather]
    let clouds: Clouds?
    let wind: Wind
    let visibility: Double
    let pop: Double
    let snow: Rain?
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, snow, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Double
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Double
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

extension Main {
    func convertToFarenheit(tempInK: Double) -> Int {
        let tempInCelcius = tempInK - 273.0
        let tempInF = (tempInCelcius * 9.0 / 5.0) + 32
        return Int(tempInF.rounded())
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

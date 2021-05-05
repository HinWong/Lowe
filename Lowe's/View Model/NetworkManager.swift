//
//  ViewModel.swift
//  Lowe's
//
//  Created by Hin Wong on 4/29/21.
//

import Foundation

class NetworkManager {
    
    static private let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast")
    static private let apiKey = "65d00499677e59496ca2f318eb68c049"
    
    static func fetchWeather(searchTerm: String, completion: @escaping (Result<CityWeatherResponse, WeatherError>) -> Void) {
        
        //1. build url
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [URLQueryItem(name: "q", value: searchTerm), URLQueryItem(name: "appid", value: apiKey)]
        guard let finalURL = urlComponents?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        //2. data task
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            //3. error handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            //4. check for data
            guard let data = data else {return completion(.failure(.noData))}
            
            // 5. decode data
            do {
                let decodedData = try JSONDecoder().decode(CityWeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
        }.resume()
    }

}


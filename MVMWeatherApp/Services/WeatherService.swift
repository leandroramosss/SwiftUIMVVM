//
//  WeatherService.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

enum NetworkError: String, Error {
    case badUrl = "Error in the request url."
    case noData
    case decodingError = "Error decoding json"
}

class WeatherService {
    
    func getWeather(city: String, completion: @escaping(Result<Weather?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForWeatherFor(city) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
                        
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse.main))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}

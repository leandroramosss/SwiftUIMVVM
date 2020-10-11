//
//  WeatherResponse.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

struct WeatherResponse: Codable {
    
    let main: Weather
    
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}

//
//  WeatherViewModel.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Weather?
    @Published var message: String = ""
    @Published var loadingState: LoadingState = .none
    @Published var temperatureUnit: TemperatureUnit = .fahrenheight
    
    var temperature: String {
        guard let temp = weather?.temp else {
            return "N/A"
        }
        
        switch temperatureUnit {
        case .fahrenheight:
            return String(format: "%.0F F", temp.toFahrenheight())
        case .celcius:
            return String(format: "%.0F C", temp.toCelsius())
        }
        
    }
    
    var humidity: String {
        guard let humidity = weather?.humidity else {
            return "N/A"
        }
        return String(format: "%.0F %%", humidity)
    }
    
    func fetchWeather(city: String) {
        
        guard let city = city.escaped() else {
            DispatchQueue.main.async {
                self.message = "The city is incorrect"
            }
            return
        }
        
        self.loadingState = .loading
        
        WeatherService().getWeather(city: city) { (result) in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                    self.loadingState = .success
                }
            case .failure(_ ):
                DispatchQueue.main.async {
                    self.message = "Unable to find the weather"
                    self.loadingState = .failed
                }
            }
        }
    }
}

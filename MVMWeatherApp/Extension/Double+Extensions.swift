//
//  Double+Extensions.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

extension Double {
    
    func toFahrenheight() -> Double {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        let convertedTemperature = temperature.converted(to: .fahrenheit)
        return convertedTemperature.value
    }
    
    func toCelsius() -> Double {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        let convertedTemperature = temperature.converted(to: .celsius)
        return convertedTemperature.value
    }
    
}

//
//  TemperatureUnit.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    case fahrenheight
    case celcius
}

extension TemperatureUnit {
    
    var title: String {
        switch self {
        case .fahrenheight:
            return "Fahrenheight"
        case .celcius:
            return "Celcius"
        }
    }
    
}

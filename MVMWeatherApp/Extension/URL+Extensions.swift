//
//  URL+Extensions.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation

extension URL {
    static func urlForWeatherFor(_ city: String) -> URL? {
        
        guard let url = URL(string: "http://api.openweathermap.org./data/2.5/weather?q=\(city)&appid=4c6ee577e9e26fbdf31493fb97e1bbcb") else {
            return nil
        }
        
        return url
        
    }
}

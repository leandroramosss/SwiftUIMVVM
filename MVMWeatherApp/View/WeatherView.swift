//
//  WeatherView.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack (spacing: 10) {
            Text("\(self.weatherViewModel.temperature)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
            Text("\(self.weatherViewModel.humidity)")
                .foregroundColor(Color.white)
                .opacity(0.7)
                
            Picker(selection: self.$weatherViewModel.temperatureUnit, label: Text("Select a Unit")) {
                ForEach(TemperatureUnit.allCases,id: \.self) {
                    unit in
                    Text(unit.title)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
    }
}

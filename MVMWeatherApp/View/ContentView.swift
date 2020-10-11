//
//  ContentView.swift
//  MVMWeatherApp
//
//  Created by Leandro Ramos on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherViewModel = WeatherViewModel()
    @State private var cityName: String = ""
    
    var body: some View {
        
        VStack {
            TextField("Search city by name", text: self.$cityName, onEditingChanged: { _ in }) {
                //perform request
                weatherViewModel.fetchWeather(city: self.cityName)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            if self.weatherViewModel.loadingState == .loading {
                LodingView()
            } else if self.weatherViewModel.loadingState == .success {
                WeatherView(weatherViewModel: weatherViewModel)
            } else if self.weatherViewModel.loadingState == .failed {
                ErrorView(message: self.weatherViewModel.message)
            }
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

//
//  WeatherModel.swift
//  SimpleWeatherApp
//
//  Created by Kostya Lee on 09/02/22.
//
 
import UIKit

final class WeatherViewModel : ObservableObject {
    @Published var city = "New York"
    @Published var temp = "24°"
    @Published var weatherType = "sunny"
    
}

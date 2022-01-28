//
//  WeatherViewModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 28/01/2022.
//

import SwiftUI
import Combine

//MARK: Interface
protocol WeatherViewViewModelInterface {
}

//MARK: Implementation
class WeatherViewModel: ObservableObject, WeatherViewViewModelInterface {
    
    let objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
    @Published var weatherModel: WeatherModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.objectWillChange.send()
            }
        }
    }
}

//
//  WeatherModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation

public struct WeatherModel {
    
    public let location: String
    public let temperature: Double
    public let condition: String
    public let description: String
    
    public init(location: String, temperature: Double, condition: String,  description: String ) {
        self.location = location
        self.temperature = temperature
        self.description = description
        self.condition = condition
    }
    
}

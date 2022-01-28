//
//  WeatherModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation

public struct WeatherModel {
    
    public let id: Int
    public let location: String
    public let temperature: Double
    public let condition: String
    public let description: String
    
    
    public init(id: Int, location: String, temperature: Double, condition: String,  description: String ) {
        self.id = id
        self.location = location
        self.temperature = temperature
        self.description = description
        self.condition = condition
    }
    
}

//
//  TestWeatherService.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import XCTest
import AppResources
@testable import iTV_Plus

class TestWeatherService: XCTestCase {
    
    var sut: WeatherService!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = WeatherService(apiKey: "", urlSession: urlSession, urlString: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWeatherService_WhenApiKeyEmpty_ShouldThrowAnError(){
        
    }
    
}

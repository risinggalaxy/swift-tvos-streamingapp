//
//  TestWeatherViewInteractor.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import XCTest
@testable import iTV_Plus
import AppResources

class TestWeatherViewInteractor: XCTestCase {
    
    var sut: WeatherViewInteractor!
    var mockWeatherPresenter: MockWeatherPresenter!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        let mockDownloadService = MockDownloadService(urlSession: urlSession, urlString: "")
        let mockLocationManager = MockLocationManager()
        
        mockWeatherPresenter = MockWeatherPresenter()
        sut = WeatherViewInteractor(downloadService: mockDownloadService, locationManager: mockLocationManager)
        sut.presenter = mockWeatherPresenter
    }
    
    override func tearDown() {
        sut = nil
        mockWeatherPresenter = nil
        super.tearDown()
    }
    
    func testWeatherViewInteractor_WhenFetchDataFromWeatherService_ShouldPassDataToPresenter() {
        
        XCTAssertFalse(mockWeatherPresenter.didReceiveDataFromInteractor)
        XCTAssertGreaterThanOrEqual(mockWeatherPresenter.numbersDidReceiveDataFromInteractor, 0)
        
        sut.fetchDataFromWeatherService()
        
        XCTAssertTrue(mockWeatherPresenter.didReceiveDataFromInteractor)
        XCTAssertGreaterThanOrEqual(mockWeatherPresenter.numbersDidReceiveDataFromInteractor, 1)
        
    }
    
    func testWeatherViewInteractor_WhenFetchSunDataFromWeatherService_ShouldReturnStringFromDoubleValue() {
        let result = sut.shouldGetSunRiseAndSetData(data: 1643483839)
        let stringValue: String = "8:17 PM"
        XCTAssertEqual(result, stringValue)
    }
    
}

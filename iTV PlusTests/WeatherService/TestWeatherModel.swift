//
//  TestWeatherModel.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import XCTest
@testable import iTV_Plus

class TestWeatherModel: XCTestCase {
    
    
    var sut: WeatherModel!
    
    override func setUp() {
        super.setUp()
        sut = kAllowedWeatherTest
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func testWeatherModel_AllPropertiesMustBeEqual_To_kAllowedWeatherTest_ConstantWeatherModel() {
        XCTAssertEqual(sut.id, kAllowedWeatherTest.id)
        XCTAssertEqual(sut.location, kAllowedWeatherTest.location)
        XCTAssertEqual(sut.temperature, kAllowedWeatherTest.temperature)
        XCTAssertEqual(sut.condition, kAllowedWeatherTest.condition)
        XCTAssertEqual(sut.description, kAllowedWeatherTest.description)
        XCTAssertEqual(sut.sunrise, kAllowedWeatherTest.sunrise)
        XCTAssertEqual(sut.sunset, kAllowedWeatherTest.sunset)
        XCTAssertEqual(sut.feelTemp, kAllowedWeatherTest.feelTemp)
    }
    
    
}

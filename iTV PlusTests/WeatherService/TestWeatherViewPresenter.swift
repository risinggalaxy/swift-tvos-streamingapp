//
//  TestWeatherViewPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import XCTest
import Combine
import AppResources
@testable import iTV_Plus

class TestWeatherViewPresenter: XCTestCase {
    
    
    var sut: WeatherViewPresenter!
    var mockInteractor: MockWeatherInteractor!
    var mockWireFrame: MockWeatherWireFrame!
    var mockWeatherViewModel: MockWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        sut = WeatherViewPresenter()
        mockInteractor = MockWeatherInteractor()
        mockWireFrame = MockWeatherWireFrame()
        mockWeatherViewModel = MockWeatherViewModel()
        sut.interactor = mockInteractor
        sut.viewModel = mockWeatherViewModel
        sut.wireFrame = mockWireFrame
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockWireFrame = nil
        mockWeatherViewModel = nil
        super.tearDown()
    }
    
    func testWeatherServicePresenter_WhenGettingData_ViewModelWeatherModelShouldNotBeNil() {
        let weatherModel = WeatherModel(id: 500, location: "Amsterdam", temperature: 10.0, condition: "🌧", description: "Rainy")
        XCTAssertNil(mockWeatherViewModel.weatherModel)
        sut.passWeatherDataToView(model: weatherModel)
        XCTAssertNotNil(mockWeatherViewModel.weatherModel)
        XCTAssertEqual(mockWeatherViewModel.weatherModel?.id, weatherModel.id)
        XCTAssertEqual(mockWeatherViewModel.weatherModel?.location, weatherModel.location)
        XCTAssertEqual(mockWeatherViewModel.weatherModel?.condition, weatherModel.condition)
        XCTAssertEqual(mockWeatherViewModel.weatherModel?.description, weatherModel.description)
        XCTAssertEqual(mockWeatherViewModel.weatherModel?.temperature, weatherModel.temperature)
    }
    
    func testWeatherServicePresenter_WhenRequestingRefreshWeatherData_InteractorsfetchDataFromWeatherService_ShouldRunOnce() {
        XCTAssertEqual(mockInteractor.numbersPresenterDidRequestRefreshingWeatherData, 1)
        sut.refreshWeatherData()
        XCTAssertTrue(mockInteractor.presenterDidRequestRefreshingWeatherData)
        XCTAssertEqual(mockInteractor.numbersPresenterDidRequestRefreshingWeatherData, 2)
    }
    
    
}

//
//  MockWeatherPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation
@testable import iTV_Plus

class MockWeatherPresenter: WeatherViewPresenterInterface {
    
    
    var viewModel: WeatherViewModel?
    var interactor: WeatherViewInteractorInterface?
    var wireFrame: WeatherViewWireFrameInterface?
    
    var didReceiveDataFromInteractor: Bool = false
    var numbersDidReceiveDataFromInteractor: Int = 0
    var dataModelFromInteractor: WeatherModel?
    
    func passWeatherDataToView(model: WeatherModel) {
        didReceiveDataFromInteractor = true
        numbersDidReceiveDataFromInteractor += 1
        dataModelFromInteractor = model
    }
    
    func refreshWeatherData() {
    }
    
}

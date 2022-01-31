//
//  MockWeatherPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation
@testable import iTV_Plus

class MockWeatherPresenter: WeatherViewPresenterInterface {
    
    var notificationCenter: NotificationCenter!
    var viewModel: WeatherViewModel?
    var interactor: WeatherViewInteractorInterface?
    var wireFrame: WeatherViewWireFrameInterface?
    
    var didReceiveDataFromInteractor: Bool = false
    var numbersDidReceiveDataFromInteractor: Int = 0
    var dataModelFromInteractor: WeatherModel?
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }
    
    func passWeatherDataToView(model: WeatherModel) {
        didReceiveDataFromInteractor = true
        numbersDidReceiveDataFromInteractor += 1
        dataModelFromInteractor = model
    }
    
    func refreshWeatherData() {
    }
    
    func refreshWeatherDataOnNotification() {
        refreshWeatherData()
    }
    
    func updateViewWithError(message: String) {
    }
}

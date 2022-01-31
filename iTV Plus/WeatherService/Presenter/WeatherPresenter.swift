//
//  WeatherPresenter.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 28/01/2022.
//

import Foundation

//MARK: Interface
protocol WeatherViewPresenterInterface {
    var viewModel: WeatherViewModel? { get set}
    var notificationCenter: NotificationCenter! { get set }
    var interactor: WeatherViewInteractorInterface? { get set }
    var wireFrame: WeatherViewWireFrameInterface? { get set }
    func refreshWeatherData()
    func refreshWeatherDataOnNotification()
    func passWeatherDataToView(model: WeatherModel)
    func updateViewWithError(message: String)
}

//MARK: Implementation
class WeatherViewPresenter: WeatherViewPresenterInterface {
    
    var notificationCenter: NotificationCenter!
    var viewModel: WeatherViewModel?
    var interactor: WeatherViewInteractorInterface? {
        didSet {
            interactor?.fetchDataFromWeatherService()
        }
    }
    
    internal var didHandleRefreshNotification: Bool = false
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        notificationCenter.addObserver(self, selector: #selector(refreshWeatherDataOnNotification),
                                               name: kRefreshWeatherDataNotificationName,
                                               object: nil)
    }
    
    var wireFrame: WeatherViewWireFrameInterface?
    
    func passWeatherDataToView(model: WeatherModel) {
        viewModel?.weatherModel = model
    }
    
    func refreshWeatherData() {
        interactor?.fetchDataFromWeatherService()
    }
    
    @objc func refreshWeatherDataOnNotification() {
        refreshWeatherData()
        didHandleRefreshNotification = true
    }
    
    func updateViewWithError(message: String) {
    }
}


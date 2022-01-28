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
    var interactor: WeatherViewInteractorInterface? { get set }
    var wireFrame: WeatherViewWireFrameInterface? { get set }
    func refreshWeatherData()
    func passWeatherDataToView(model: WeatherModel)
}

//MARK: Implementation
class WeatherViewPresenter: WeatherViewPresenterInterface {
    
    var viewModel: WeatherViewModel?
    var interactor: WeatherViewInteractorInterface? {
        didSet {
            interactor?.fetchDataFromWeatherService()
        }}
    
    var wireFrame: WeatherViewWireFrameInterface?
    
    func passWeatherDataToView(model: WeatherModel) {
        viewModel?.weatherModel = model
    }
    
    func refreshWeatherData() {
        interactor?.fetchDataFromWeatherService()
    }
}


//
//  WeatherViewWireFrameInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation
import CoreLocation

protocol WeatherViewWireFrameInterface {
    static func presentViewController() -> WeatherView
}

class WeatherViewWireframe: WeatherViewWireFrameInterface {
    static func presentViewController() -> WeatherView {
        let downloadService = DownloadService(urlString:"")
        let interactor = WeatherViewInteractor(downloadService: downloadService, locationManager: CLLocationManager())
        let presenter = WeatherViewPresenter()
        let wireFrame = WeatherViewWireframe()
        let viewModel = WeatherViewModel()
        interactor.presenter = presenter
        presenter.viewModel = viewModel
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        let view = WeatherView(presenter: presenter, viewModel: viewModel)
        return view
    }
    
}





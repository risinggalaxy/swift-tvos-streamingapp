//
//  mockWeatherInteractor.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Combine
import CoreLocation
@testable import iTV_Plus

class MockWeatherInteractor:
                                
    WeatherViewInteractorInterface {
    
    var notificationCenter: NotificationCenter!
    
    var locationManager: CLLocationManager?
    
    var downloadService: DownloadServiceInterface?
    
    var presenter: WeatherViewPresenterInterface?
    
    var presenterDidRequestRefreshingWeatherData:Bool = false
    var numbersPresenterDidRequestRefreshingWeatherData: Int = 0
    
    
    func fetchDataFromWeatherService() {
        presenterDidRequestRefreshingWeatherData = true
        numbersPresenterDidRequestRefreshingWeatherData += 1
    }
    
    func shouldGetSunRiseAndSetData(data: Double) -> String {
        return ""
    }
    
}

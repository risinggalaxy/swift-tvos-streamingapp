//
//  WeatherInteractor.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 28/01/2022.
//

import SwiftUI
import Combine
import CoreLocation
import AppResources

//MARK: Interface
protocol WeatherViewInteractorInterface {
    var locationManager: CLLocationManager? { get set}
    var downloadService: DownloadServiceInterface? { get set }
    var presenter: WeatherViewPresenterInterface? { get set }
    func fetchDataFromWeatherService()
}

//MARK: Implementation
class WeatherViewInteractor: NSObject, WeatherViewInteractorInterface, CLLocationManagerDelegate {
    
    internal var locationManager: CLLocationManager?
    var downloadService: DownloadServiceInterface?
    var presenter: WeatherViewPresenterInterface?
    internal var isAllowedToUseLocation: Bool = false
    
    init(downloadService: DownloadServiceInterface, locationManager: CLLocationManager) {
        super.init()
        self.downloadService = downloadService
        self.locationManager = locationManager
        self.locationManager?.delegate = self
    }
    
    func fetchDataFromWeatherService() {
        
        presenter?.passWeatherDataToView(model: kDefaultWeather)
        
        switch locationManager?.authorizationStatus {
        case .notDetermined: locationManager?.requestWhenInUseAuthorization()
            isAllowedToUseLocation = true
            
        case .authorizedAlways, .authorizedWhenInUse:
            guard let latitude = locationManager?.location?.coordinate.latitude else {
                presenter?.passWeatherDataToView(model: kDefaultWeather)
                //TODO: Tell Presenter To Update WeatherView + Write UnitTest
                return
            }
            guard let longitude = locationManager?.location?.coordinate.longitude else {
                //TODO: Tell Presenter To Update WeatherView + Write UnitTest
                return
            }
            
            downloadService?.urlString =
            "\(kOpenWeatherMapUrlString)lat=\(latitude)&lon=\(longitude)&appid=\(kOpenWeatherMapApikey)&units=metric"
            downloadService?.downloader(completionHandler: { [weak self] data, error in
                guard let strongSelf = self else { return }
                if let receivedError = error {
                    print(receivedError.localizedDescription)
                    //TODO: Tell Presenter To Update WeatherView With Error + Write Unit Test
                }
                guard let receivedData = data else {
                    //TODO: Tell Presenter To Update WeatherView + Write Unit Test
                    return
                }
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: receivedData, options:[]) as! [String : Any]
                    
                    let weather = jsonData["weather"] as! [Any]
                    let weatherArray = weather[0] as! [String: Any]
                    let description = weatherArray["description"] as! String
                    let condition = weatherArray["id"] as! Int
                    let main = jsonData["main"] as! [String: Any]
                    let temperature = main["temp"] as! Double
                    let location = jsonData["name"] as! String
                    let weatherModel = WeatherModel(id: condition, location: location,
                                                    temperature: temperature,
                                                    condition: selectWeatherScene(condition: condition).emoji,
                                                    description: "It is \(description)")
                    strongSelf.presenter?.passWeatherDataToView(model: weatherModel)
                    //Update spriteScene constants
                    kWeatherGradientColor = selectWeatherScene(condition: condition).gradientColors
                    kWeatherSceneName = selectWeatherScene(condition: condition).sceneName
                    NotificationCenter.default.post(name: Notification.Name("UpdateNode"), object: nil)
                    
                } catch let error {
                    //TODO: Tell Presenter To Update WeatherView With Error + Write Unit Test
                    fatalError("\(error)")
                }
            })
            
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if isAllowedToUseLocation {
            fetchDataFromWeatherService()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
    
}


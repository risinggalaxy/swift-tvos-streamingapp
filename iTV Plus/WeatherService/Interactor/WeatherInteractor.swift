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
    var notificationCenter: NotificationCenter! { get set }
    var downloadService: DownloadServiceInterface? { get set }
    var presenter: WeatherViewPresenterInterface? { get set }
    func shouldGetSunRiseAndSetData(data: Double) -> String
    func fetchDataFromWeatherService()
}

//MARK: Implementation
class WeatherViewInteractor: NSObject, WeatherViewInteractorInterface, CLLocationManagerDelegate {
    
    internal var locationManager: CLLocationManager?
    var downloadService: DownloadServiceInterface?
    var presenter: WeatherViewPresenterInterface?
    var notificationCenter: NotificationCenter!
    internal var isAllowedToUseLocation: Bool = false
    
    init(downloadService: DownloadServiceInterface, locationManager: CLLocationManager,
         notificationCenter: NotificationCenter = .default) {
        super.init()
        self.downloadService = downloadService
        self.locationManager = locationManager
        self.locationManager?.delegate = self
        self.notificationCenter = notificationCenter
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
                if error != nil {
                    strongSelf.presenter?.updateViewWithError(message: WeatherError.failedToConnectToWeatherApi.localizedDescription)
                }
                guard let receivedData = data else {
                    strongSelf.presenter?.updateViewWithError(message: WeatherError.failedWithCorruptWeatherData.localizedDescription)
                    return
                }
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: receivedData, options:[]) as! [String : Any]
                    
                    guard let weather = jsonData["weather"] as? [Any] else {
                        strongSelf.presenter?.updateViewWithError(message: WeatherError.failedToGetWeatherData.localizedDescription)
                        return
                    }
                    let weatherArray = weather[0] as! [String: Any]
                    let description = weatherArray["description"] as! String
                    let condition = weatherArray["id"] as! Int
                    let main = jsonData["main"] as! [String: Any]
                    let temperature = main["temp"] as! Double
                    let feelTemperature = main["feels_like"] as! Double
                    let location = jsonData["name"] as! String
                    let sunInformation = jsonData["sys"] as! [String: Any]
                    
                    let sunriseDouble = sunInformation["sunrise"] as! Double
                    let sunsetDouble = sunInformation["sunset"] as! Double
                    
                    let sunrise: String = strongSelf.shouldGetSunRiseAndSetData(data: sunriseDouble)
                    let sunset: String = strongSelf.shouldGetSunRiseAndSetData(data: sunsetDouble)
                    
                    let weatherModel = WeatherModel(id: condition, location: location,
                                                    temperature: temperature,
                                                    condition: selectWeatherScene(condition: condition).emoji,
                                                    description: "It is \(description)", sunrise: sunrise, sunset: sunset, feelTemp: feelTemperature)
                    strongSelf.presenter?.passWeatherDataToView(model: weatherModel)
                    //Update spriteScene constants
                    kWeatherGradientColor = selectWeatherScene(condition: condition).gradientColors
                    kWeatherSceneName = selectWeatherScene(condition: condition).sceneName
                    strongSelf.notificationCenter.post(name: kUpdateWeatherSceneNotificationName, object: nil)
                } catch let error {
                    strongSelf.presenter?.updateViewWithError(message: "\(WeatherError.failedWith(description: error.localizedDescription))")
                }
            })
            
        default:
            break
        }
    }
    
    func shouldGetSunRiseAndSetData(data: Double) -> String {
        let timeInterval: TimeInterval = data
        let date = Date(timeIntervalSince1970: timeInterval)
        let stringValue = date.formatted(date: .omitted, time: .shortened)
        return stringValue
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if isAllowedToUseLocation {
            fetchDataFromWeatherService()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
    
}


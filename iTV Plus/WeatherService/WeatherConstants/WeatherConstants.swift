//
//  WeatherConstants.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import UIKit

public let kWeatherAndDateMainFontSize: CGFloat = 150
public let kWeatherAndDateSubFontSize: CGFloat = 35
public let kWeatherAndDatePaddingValue: CGFloat = 80
public var kWeatherSceneName: String = ""
public var kShadowRadius: Double = 10.0
public let kOpenWeatherMapApikey: String = "f27370810202ecd1fe156adf192765f3"
public let kOpenWeatherMapUrlString: String = "https://api.openweathermap.org/data/2.5/weather?"
public var kWeatherGradientColor: [CGColor] = []
public let kDefaultWeather = WeatherModel(location: "🤷🏻", temperature: 0.0, condition: "🤷🏻", description: "Location services was denied")
public let kAllowedWeatherTest = WeatherModel(location: "Amsterdam", temperature: 10.0, condition: "☀️", description: "It sunny")

//Returns a tuple based on the current weather condition
public func selectWeatherScene(condition: Int) -> (emoji: String, sceneName: String, gradientColors: [CGColor]) {
    switch condition {
    case 0..<300: return ("🌩", "Thunder", [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor])
    case 300..<400: return ("🌧", "Rain", [#colorLiteral(red: 0.02510557379, green: 0.07943536905, blue: 0.1097243737, alpha: 1).cgColor, #colorLiteral(red: 0.1377823751, green: 0.1735397401, blue: 0.1785311301, alpha: 1).cgColor, #colorLiteral(red: 0.2699754662, green: 0.2699754662, blue: 0.2699754662, alpha: 1).cgColor])
    case 400..<600: return ("☔️", "HardRain", [#colorLiteral(red: 0.03080503903, green: 0.04410742557, blue: 0.05576025043, alpha: 1).cgColor, #colorLiteral(red: 0.1659383968, green: 0.1785685279, blue: 0.1975497791, alpha: 1).cgColor, #colorLiteral(red: 0.2699754662, green: 0.2699754662, blue: 0.2699754662, alpha: 1).cgColor])
    case 600..<700: return ("☃️", "Snow", [#colorLiteral(red: 0.1351598366, green: 0.07882106616, blue: 0.1321709145, alpha: 1).cgColor, #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor])
    case 700..<800: return ("🌫", "Fog", [#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor, #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor])
    case 800: return ("☀️", "Sunny", [#colorLiteral(red: 0.01882125568, green: 0.08756443198, blue: 0.2762376451, alpha: 1).cgColor, #colorLiteral(red: 0.1380871004, green: 0.3388927544, blue: 0.5795638881, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor])
    case 800...804: return ("☁️", "Cloud", [#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor, #colorLiteral(red: 0.670000947, green: 0.7956507735, blue: 0.8575646668, alpha: 1).cgColor])
    default: return ("🤷🏻", "Empty", [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor])
    }
}


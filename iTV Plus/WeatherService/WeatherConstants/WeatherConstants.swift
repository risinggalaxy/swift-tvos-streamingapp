//
//  WeatherConstants.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import UIKit

public let kWeatherAndDateMainFontSize: CGFloat = 150
public let kWeatherAndDateSubFontSize: CGFloat = 35
public let kWeatherAndDatePaddingValue: CGFloat = 100
public var kWeatherSceneName: String = ""
public var kShadowRadius: Double = 10.0
public let kOpenWeatherMapApikey: String = "YOUR-API-KEY"
public let kOpenWeatherMapUrlString: String = "https://api.openweathermap.org/data/2.5/weather?"
public var kWeatherGradientColor: [[CGColor]] = [[],[]]
public let kDefaultWeather = WeatherModel(id: 900, location: "🤷🏻", temperature: 0.0, condition: "🤷🏻", description: "Location services was denied")
public let kAllowedWeatherTest = WeatherModel(id: 800, location: "Amsterdam", temperature: 10.0, condition: "☀️", description: "It sunny")

//Returns a tuple based on the current weather condition
public func selectWeatherScene(condition: Int) -> (emoji: String, sceneName: String, gradientColors: [[CGColor]]) {
    switch condition {
    case 0..<300: return ("🌩", "Thunder", [[#colorLiteral(red: 0.1509106308, green: 0.186377099, blue: 0.2000549946, alpha: 1).cgColor, #colorLiteral(red: 0.2327729237, green: 0.296928242, blue: 0.3109861551, alpha: 1).cgColor, #colorLiteral(red: 0.400087033, green: 0.493994333, blue: 0.5630689607, alpha: 1).cgColor],
                                            [#colorLiteral(red: 0.005173889203, green: 0.01725598739, blue: 0.02423110897, alpha: 1).cgColor, #colorLiteral(red: 0.1329410986, green: 0.1195110315, blue: 0.1253750187, alpha: 1).cgColor, #colorLiteral(red: 0.1169851338, green: 0.1480228377, blue: 0.2534959931, alpha: 1).cgColor]])
        
    case 300..<400: return ("🌧", "Rain", [[#colorLiteral(red: 0.2448899703, green: 0.2982910137, blue: 0.3200604886, alpha: 1).cgColor, #colorLiteral(red: 0.3377719724, green: 0.4247584523, blue: 0.444262947, alpha: 1).cgColor, #colorLiteral(red: 0.400087033, green: 0.493994333, blue: 0.5630689607, alpha: 1).cgColor],
                                           [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.2329102322, green: 0.2127533675, blue: 0.3329676113, alpha: 1).cgColor]])
        
    case 400..<600: return ("☔️", "HardRain", [[#colorLiteral(red: 0.1552101569, green: 0.2341545046, blue: 0.2677945796, alpha: 1).cgColor, #colorLiteral(red: 0.2002319758, green: 0.3501658926, blue: 0.3849931697, alpha: 1).cgColor, #colorLiteral(red: 0.3547513474, green: 0.4342378897, blue: 0.4559822285, alpha: 1).cgColor],
                                               [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.1463210687, green: 0.1344414873, blue: 0.2116840703, alpha: 1).cgColor]])
        
    case 600..<700: return ("☃️", "Snow", [[#colorLiteral(red: 0.30240036, green: 0.373283696, blue: 0.3951275958, alpha: 1).cgColor, #colorLiteral(red: 0.4045423942, green: 0.4715367864, blue: 0.501960814, alpha: 1).cgColor, #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor],
                                           [#colorLiteral(red: 0.005173889203, green: 0.01725598739, blue: 0.02423110897, alpha: 1).cgColor, #colorLiteral(red: 0.1329410986, green: 0.1195110315, blue: 0.1253750187, alpha: 1).cgColor, #colorLiteral(red: 0.342501325, green: 0.3248652937, blue: 0.389499389, alpha: 1).cgColor]])
        
    case 700..<800: return ("🌫", "Fog", [[#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor, #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor],
                                          [#colorLiteral(red: 0.1298502792, green: 0.1397336219, blue: 0.1545868494, alpha: 1).cgColor, #colorLiteral(red: 0.3766038842, green: 0.3766038842, blue: 0.3766038842, alpha: 1).cgColor, #colorLiteral(red: 0.1258975157, green: 0.1258975157, blue: 0.1258975157, alpha: 1).cgColor]])
        
    case 800: return ("🌕", "Sunny", [[#colorLiteral(red: 0.01882125568, green: 0.08756443198, blue: 0.2762376451, alpha: 1).cgColor, #colorLiteral(red: 0.1768024228, green: 0.4437824229, blue: 0.7586946783, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor],
                                      [#colorLiteral(red: 0.01882125568, green: 0.08756443198, blue: 0.2762376451, alpha: 1).cgColor, #colorLiteral(red: 0.2329102322, green: 0.2127533675, blue: 0.3329676113, alpha: 1).cgColor]])
        
    case 800...804: return ("☁️", "Cloud", [[#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor,  #colorLiteral(red: 0.3378952877, green: 0.470396907, blue: 0.5647059083, alpha: 1).cgColor, #colorLiteral(red: 0.7963063114, green: 0.7963063114, blue: 0.7963063114, alpha: 1).cgColor, #colorLiteral(red: 0.267553073, green: 0.6387435966, blue: 0.9006697234, alpha: 1).cgColor],
                                            [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.2385017335, green: 0.2194320292, blue: 0.4244422471, alpha: 1).cgColor]])
        
    default: return ("🤷🏻", "Empty", [[#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor],
                                       [#colorLiteral(red: 0.03210597129, green: 0.1015849986, blue: 0.1403197402, alpha: 1).cgColor, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor, #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor]])
    }
}


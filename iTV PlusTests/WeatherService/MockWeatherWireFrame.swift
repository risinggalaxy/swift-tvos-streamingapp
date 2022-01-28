//
//  MockWeatherWireFrame.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import Foundation
import SwiftUI
@testable import iTV_Plus

class MockWeatherWireFrame: WeatherViewWireFrameInterface {
    
    static func presentViewController() -> WeatherView {
        let view = WeatherView(viewModel: MockWeatherViewModel())
        return view
    }
    
}

//
//  WeatherView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import SwiftUI
import SpriteKit

struct WeatherView: View, WeatherViewInterface {
    
    @Environment(\.scenePhase) var scenePhase
    @State var presenter: WeatherViewPresenterInterface?
    @StateObject var viewModel: WeatherViewModel
    var body: some View {
        ZStack {
            ZStack {
                GeometryReader { _ in
                    SpriteView(scene: WeatherScene(), options: [.allowsTransparency])
                }.ignoresSafeArea()
            }
            VStack(alignment: .trailing) {
                HStack(spacing: 10) {
                    WeatherInformationView(weatherModel: viewModel.weatherModel ?? kDefaultWeather)
                        .padding(EdgeInsets(top: kWeatherAndDatePaddingValue, leading: kWeatherAndDatePaddingValue, bottom: 0.0, trailing: 0.0))
                    Spacer()
                    TimeAndDateView()
                        .padding(EdgeInsets(top: kWeatherAndDatePaddingValue, leading: 0.0, bottom: 0.0, trailing: kWeatherAndDatePaddingValue))
                }
                Spacer()
            }.shadow(radius: kShadowRadius)
                .onChange(of: scenePhase, perform: { newValue in
                    switch newValue {
                    case .active: presenter?.refreshWeatherData()
                    case .inactive: print("Inactive")
                    case .background: print("Background")
                    default: presenter?.refreshWeatherData()
                    }
                })
        }
    }
}


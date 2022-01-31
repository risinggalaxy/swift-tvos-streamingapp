//
//  WeatherInformationView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import SwiftUI

struct WeatherInformationView: View {
    
    var weatherModel: WeatherModel
    @State var widgetsOpacity: Double = 0.0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: -10) {
            HStack(spacing: 1) {
                Text("\(Int(weatherModel.temperature))°")
                    .foregroundColor(.white)
                    .font(.system(size: kWeatherAndDateMainFontSize, weight: .black, design: .default))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5))
                
                    Text(weatherModel.condition)
                    .foregroundColor(.white)
                    .font(.system(size: kWeatherAndDateMainFontSize - 70, weight: .black, design: .default))
            }
            VStack(alignment: .leading, spacing: 20) {
                Text(weatherModel.description + " in " + weatherModel.location)
                    .foregroundColor(.white)
                    .font(.system(size: kWeatherAndDateSubFontSize, weight: .medium, design: .default))
                    .frame(alignment: .leading)
                VStack(alignment: .leading, spacing: 10){
                Text("☀️ Sunrise \(weatherModel.sunrise) ")
                    .modifier(WeatherSubTextModifier())
                Text("🌗 Sunset \(weatherModel.sunset) ")
                    .modifier(WeatherSubTextModifier())
                Text("🌡 Feel Temperature \(Int(weatherModel.feelTemp)) ")
                    .modifier(WeatherSubTextModifier())
                }
            }
            
        }.opacity(widgetsOpacity)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                widgetsOpacity = 1.0
            }
        }
    }
}

struct WeatherInformationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInformationView(weatherModel: kAllowedWeatherTest)
    }
}

struct WeatherSubTextModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
            .background(.quaternary, in: Capsule()).foregroundColor( colorScheme == .light ? .white : .black)
    }
}

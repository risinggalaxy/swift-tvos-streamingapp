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
            Text(weatherModel.description + " in " + weatherModel.location)
                .foregroundColor(.white)
                .font(.system(size: kWeatherAndDateSubFontSize, weight: .medium, design: .default))
                .frame(alignment: .leading)
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
        WeatherInformationView(weatherModel: WeatherModel(location: "Amsterdam", temperature: 33.0, condition: "☀️", description: "It is currently sunny"))
    }
}

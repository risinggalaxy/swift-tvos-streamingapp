//
//  TimeAndDateView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import SwiftUI

struct TimeAndDateView: View {
    
    var calendarComponent = Calendar.current
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var digitalClockValue: String = "10:10"
    @State var currentDate: String = "31 - 12 - 2021"
    @State var dateOpacity: Double = 0.0
    
    var body: some View {
        VStack(alignment: .trailing, spacing: -10) {
            Text(digitalClockValue)
                .foregroundColor(.white)
                .font(.system(size: kWeatherAndDateMainFontSize, weight: .black, design: .default))
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5))
            Text(currentDate)
                .foregroundColor(.white)
                .font(.system(size: kWeatherAndDateSubFontSize, weight: .medium, design: .default))
                .frame(alignment: .trailing)
        }
        
        .opacity(dateOpacity)
        .onReceive(timer, perform: { currentDate  in
            let clock = calendarComponent.dateComponents([.second, .minute, .hour, .day, .weekday], from: currentDate)
            let DateString = DateFormatter.localizedString(from: currentDate, dateStyle: .full, timeStyle: .none)
            self.currentDate = DateString
            digitalClockValue = "\(shouldAddZeroTo(value: clock.hour)):\(shouldAddZeroTo(value: clock.minute))"
            withAnimation(Animation.easeInOut(duration: 2.0)){
                dateOpacity = 1.0
            }
        })
    }
    
    func shouldAddZeroTo(value: Int?) -> String {
        guard let timeComponent = value else { return "No valid time"}
        if timeComponent < 10 {
            return "0\(timeComponent)"
        } else {
            return "\(timeComponent)"
        }
    }
}

struct TimeAndDateView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndDateView()
    }
}

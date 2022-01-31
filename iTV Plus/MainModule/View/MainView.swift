//
//  MainView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AppResources
import AVKit

struct MainView: View, MainViewInterface {
    
    @State var presenter: MainPresenterInterface?
    @StateObject var mainViewModel: MainViewModel
    
    fileprivate func extractedErrorMessage() -> some View {
        return Text(mainViewModel.errorMessage)
            .font(.system(size: 30, weight: .bold, design: .default))
    }
    
    var body: some View {
        ZStack {
            WeatherViewWireframe.presentViewController()
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .padding(200)
                if !mainViewModel.categories.isEmpty {
                    CategoryListView(categories: mainViewModel.categories, presenter: $presenter)
                    if !mainViewModel.errorMessage.isEmpty {
                        extractedErrorMessage()
                    }
                } else {
                    if mainViewModel.errorMessage.isEmpty {
                        Spacer()
                       ProgressIndicatorView()
                    } else {
                        extractedErrorMessage()
                    }
                }
                Spacer()
                CopyRightView()
            }.shadow(radius: kShadowRadius)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
            .preferredColorScheme(.light)
    }
}

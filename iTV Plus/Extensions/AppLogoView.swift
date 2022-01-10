//
//  AppLogoView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import SwiftUI

struct AppLogoView: View {
    var body: some View {
        Image("appLogo", bundle: nil)
            .padding(100)
            .scaleEffect(0.8)
            .opacity(0.5)
    }
}

struct AppLogoView_Previews: PreviewProvider {
    static var previews: some View {
        AppLogoView()
    }
}

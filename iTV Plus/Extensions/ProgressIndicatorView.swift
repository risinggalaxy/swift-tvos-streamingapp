//
//  ProgressIndicatorView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import SwiftUI

struct ProgressIndicatorView: View {
    var body: some View {
        VStack {
            ProgressView()
                .padding()
                .tint(Color(uiColor: UIColor(named: "titleColor")!))
        Text("Loading...")
            .font(.system(size: 25, weight: .bold, design: .default))
            .foregroundColor(Color(uiColor: UIColor(named: "titleColor")!))
        }
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorView()
    }
}

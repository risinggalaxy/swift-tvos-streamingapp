//
//  CopyRightView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 09/01/2022.
//

import SwiftUI

struct CopyRightView: View {
    var body: some View {
        Text("Designed And Developed By: Yasser Farahi © RISING GALAXY 2021 - 2022")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.white)
    }
}

struct CopyRightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyRightView()
    }
}

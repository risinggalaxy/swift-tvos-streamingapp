//
//  ChannelsIdentView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import SwiftUI
import AppResources

struct ChannelsIdentView: View {
    
    @State var parentCategory: (title: String, icon: String)
    
    var body: some View {
        VStack {
            Text(parentCategory.icon)
                .font(.system(size: 200))
            Text(parentCategory.title)
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor(named: "titleColor")!))
            
        }
    }
}

struct ChannelsIdentView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsIdentView(parentCategory: ("Design", "👨🏻‍🎨"))
    }
}

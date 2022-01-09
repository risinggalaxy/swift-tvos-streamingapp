//
//  CellDesign.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 23/12/2021.
//

import SwiftUI
import AppResources
import AVFoundation

struct CategoryCellDesign: View {
    
    var category: ITVCategory
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(UIColor(named: "cellBGColor") ?? .white))
                .modifier(MyChannelBackgroundFrame())
                .overlay {
                    VStack(spacing: 20) {
                        Spacer()
                        Text(category.icon)
                            .font(.system(size: 50))
                        Text(category.title)
                            .modifier(MyChannelNameTextModifier())
                        Spacer()
                    }
                }
                .clipped()
        }.background(.clear)
    }
}

struct CellDesign_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCellDesign(category: FakeCategories.categories.first!)
    }
}

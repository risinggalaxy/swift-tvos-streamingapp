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
    
    var category: Categorie
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .background(.clear)
                .frame(width: 350, height: 220, alignment: .center)
                .overlay {
                    VStack(spacing: 10) {
                        Circle()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.clear)
                            .overlay {
                                Text("\(category.image)")
                                    .font(.system(size: 50, weight: .bold, design: .default))
                            }
                            .clipped()
                        Text(category.title)
                        .font(.system(size: 35, weight: .bold, design: .default))
                        
                    }
                }
                .clipped()
        }
    }
}

struct CellDesign_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCellDesign(category: FakeCategories.categories.first!)
    }
}

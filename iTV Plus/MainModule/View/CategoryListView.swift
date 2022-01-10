//
//  CategoryListView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import SwiftUI
import AppResources

struct CategoryListView: View {
    
    @State var categories: [ITVCategory]
    @Binding var presenter: MainPresenterInterface?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button {
                        presenter?.presentCategory(with: category)
                    } label: {
                        CategoryCellDesign(category: category)
                    }
                    .buttonStyle(CardButtonStyle())
                    .contextMenu {
                        ForEach(category.channels) { channel in
                            Button(action: {
                                presenter?.presentPlayerView(with:channel)
                            }, label: {
                                Text(channel.title)
                            })
                        }
                    }
                }
            }
            .fullWidth(with: 500)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesPreviewBinder()
    }
}

struct CategoriesPreviewBinder: View {
    @State var presenter: MainPresenterInterface?
    var categories: [ITVCategory] = FakeCategories.categories
    var body: some View {
        CategoryListView(categories: categories, presenter: $presenter)
    }
}

//
//  MainView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AppResources

struct MainView: View, MainViewInterface {
    
    var presenter: MainPresenterInterface?
    @StateObject var mainViewModel: MainViewModel
    
    var body: some View {
        if !mainViewModel.categories.isEmpty {
            List {
                ForEach(mainViewModel.categories, id: \.self) { category in
                    CellDesign(category: category)
                }
            }
        } else {
            Text(mainViewModel.errorMessage)
                .font(.system(size: 25, weight: .bold, design: .default))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
    }
}

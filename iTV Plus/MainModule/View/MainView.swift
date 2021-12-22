//
//  MainView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI

struct MainView: View, MainViewInterface {
    
    var presenter: MainPresenterInterface?
    @ObservedObject var mainViewModel: MainViewModel
    
    var body: some View {
        List {
            ForEach(mainViewModel.categories, id: \.self) { category in
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
    }
}

//
//  MockView.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
@testable import iTV_Plus

struct MockView: View, MainViewInterface {
    
    var presenter: MainPresenterInterface?
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        Text("Hello World")
    }
    
}

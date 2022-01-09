//
//  MockMainPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

@testable import iTV_Plus

class MockMainPresenter: MainPresenterInterface {

    var mainViewModel: MainViewModel?
    var interactor: MainInteractorInterface?
    var wireFrame: MainWireFrameInterface?
    
    func updateViewModel(_ categories: [Categories]) {
    }
    
    func notifyViewWithError(message: String) {
    }
       
    func presentPlayerView(with channel: Channel) {
    }
    
    func presentCategory(with category: Categories) {
    }

}

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
    
    var notificationCenter: NotificationCenter!
    var mainViewModel: MainViewModel?
    var interactor: MainInteractorInterface?
    var wireFrame: MainWireFrameInterface?
    
    func updateViewModel(_ categories: [ITVCategory]) {
    }
    
    func notifyViewWithError(message: String) {
    }
       
    func presentPlayerView(with channel: Channel) {
    }
    
    func presentCategory(with category: ITVCategory) {
    }
    
    func refreshChannelData() {
    }

}

//
//  MainPresenter.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

let kRefreshChannelsNotificationName = NSNotification.Name("UpdateChannels")

class MainPresenter: MainPresenterInterface {
    
    weak var mainViewModel: MainViewModel?
    var interactor: MainInteractorInterface?
    var wireFrame: MainWireFrameInterface?
    var notificationCenter: NotificationCenter!
    var didHandleNotificationCall: Bool = false
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        notificationCenter.addObserver(self, selector: #selector(refreshChannelData),
                                       name: kRefreshChannelsNotificationName,
                                       object: nil)
    }
    
    func updateViewModel(_ categories: [ITVCategory]) {
        mainViewModel?.categories = categories
    }
    
    func notifyViewWithError(message: String) {
        mainViewModel?.errorMessage = message
    }
    
    func presentPlayerView(with channel: Channel) {
        wireFrame?.presentChannelView(with: channel)
    }
    
    func presentCategory(with category: ITVCategory) {
        wireFrame?.presentCategory(with: category)
    }
    
    @objc func refreshChannelData() {
        mainViewModel?.categories.removeAll()
        interactor?.startDownload()
        didHandleNotificationCall = true
        
    }
    
}

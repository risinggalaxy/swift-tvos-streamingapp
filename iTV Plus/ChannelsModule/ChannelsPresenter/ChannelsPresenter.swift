//
//  ChannelsPresenter.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

class ChannelsPresenter: ChannelsPresenterInterface {

    weak var channelsViewModel: ChannelsViewModel?
    var interactor: ChannelsInteractorInterface?
    var wireFrame: ChannelsWireFrameInterface?
    
    func presentCategory(with channel: Channel) throws {
        do {
            try wireFrame?.presentPlayer(with: channel)
        } catch let error {
            throw ErrorHandler.failedRequest(description: error.localizedDescription)
        }
    }
    
}

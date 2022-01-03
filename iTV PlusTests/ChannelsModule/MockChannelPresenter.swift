//
//  MockChannelPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import Foundation
import AppResources
@testable import iTV_Plus

class MockChannelPresenter: ChannelsPresenterInterface {
    
    var channelsViewModel: ChannelsViewModel?
    var interactor: ChannelsInteractorInterface?
    var wireFrame: ChannelsWireFrameInterface?
    
    func presentCategory(with channel: Channel) throws {
    }
}

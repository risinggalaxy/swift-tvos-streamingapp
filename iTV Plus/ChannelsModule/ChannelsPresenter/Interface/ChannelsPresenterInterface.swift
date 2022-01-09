//
//  ChannelsPresenterInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

protocol ChannelsPresenterInterface {
    
    var channelsViewModel: ChannelsViewModel? { get set }
    var interactor: ChannelsInteractorInterface? { get set }
    var wireFrame: ChannelsWireFrameInterface? { get set }
    func presentCategory(with channel: Channel) throws
    
}

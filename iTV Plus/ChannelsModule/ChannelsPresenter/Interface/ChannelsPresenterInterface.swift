//
//  ChannelsPresenterInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

protocol ChannelsPresenterInterface {
    
    var channelsViewModel: ChannelsViewModel? { get set }
    var interactor: ChannelsInteractorInterface? { get set }
    var wireFrame: ChannelsWireFrame? { get set }
    
}

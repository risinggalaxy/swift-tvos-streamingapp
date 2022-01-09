//
//  ChannelsViewInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

protocol ChannelsViewInterface {
    var presenter: ChannelsPresenterInterface? { get set }
    func provideChannels(from channels: [Channel]?) throws -> [Channel]
}

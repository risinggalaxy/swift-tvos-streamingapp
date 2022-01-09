//
//  PlayerViewInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

protocol PlayerViewInterface {
    var presenter: PlayerPresenterInterface? { get set }
    func playingChannel( _ channel: Channel?) throws -> Channel
    func channelUrl( from string: String) throws -> URL
}

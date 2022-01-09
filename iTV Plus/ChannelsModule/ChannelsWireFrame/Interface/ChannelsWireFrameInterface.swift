//
//  ChannelsWireFrameInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import UIKit
import AppResources

protocol ChannelsWireFrameInterface {
    
    static var rootView: VIEW? { get set }
    static func presentViewController(on view: VIEW, parentCategory: (title: String, icon: String), channels: [Channel]) -> VIEW
    func presentPlayer(with channel: Channel) throws
    
}

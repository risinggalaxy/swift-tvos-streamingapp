//
//  MockChannelsWireFrame.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import Foundation
import AppResources
@testable import iTV_Plus

class MockChannelsWireFrame: ChannelsWireFrameInterface {
    
    static var rootView: VIEW?
    
    static func presentViewController(on view: VIEW, parentCategory: (title: String, icon: String), channels: [Channel]) -> VIEW {
        let view = VIEW()
        return view
    }
    
    func presentPlayer(with channel: Channel) throws {
    }
    
}

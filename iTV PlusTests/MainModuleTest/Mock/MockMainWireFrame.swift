//
//  MockMainWireFrame.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources
import UIKit
@testable import iTV_Plus

class MockMainWireFrame: MainWireFrameInterface {

    static var rootView: VIEW?
    
    var didReceiveChannels: Bool = false
    var didCallPresentChannelView: Bool = false
    
    var didReceiveCategory: Bool = false
    var didCallPresentCategoryView: Bool = false
    
    static func presentViewController(window: UIWindow) -> VIEW {
        let view = VIEW()
        return view
    }
    
    func presentChannelView(with channel: Channel) -> Bool {
        if !channel.title.isEmpty {
            didReceiveChannels = true
        }
        didCallPresentChannelView = true
        return didCallPresentChannelView
    }
    
    func presentCategory(with category: ITVCategory) -> Bool {
        if !category.channels.isEmpty {
            didReceiveCategory = true
        }
        didCallPresentCategoryView = true
        return didCallPresentCategoryView
    }
    
}

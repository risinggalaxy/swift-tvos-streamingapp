//
//  TestChannelsWireFrame.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import XCTest
import AppResources
@testable import iTV_Plus
import SwiftUI

class TestChannelsWireFrame: XCTestCase {
    
    var sut: ChannelsWireFrame!
    
    override func setUp() {
        sut = ChannelsWireFrame()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testChannelsWireFrame_WhenPresentingNewViewWithChannel_ShouldNotThrowAnError() {
        let stringValue = "One"
        let mockPresenter = MockChannelPresenter()
        let mockChannelView = MockChannelsView(presenter: mockPresenter, viewModel: ChannelsViewModel())
        ChannelsWireFrame.rootView = UIHostingController(rootView: mockChannelView)
        let channel = Channel(id: 0, title: stringValue, image: stringValue, url: stringValue)
        XCTAssertNoThrow(try sut.presentPlayer(with: channel))
        
    }
    
    func testChannelsWireFrame_WhenNoParentViewSet_ShouldThrowAnError() {
        let stringValue = "One"
        let channel = Channel(id: 0, title: stringValue, image: stringValue, url: stringValue)
        ChannelsWireFrame.rootView = nil
        XCTAssertThrowsError(try sut.presentPlayer(with: channel))
        do {
            try sut.presentPlayer(with: channel)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.noParentViewWasFound.localizedDescription)
        }
    }
    
}

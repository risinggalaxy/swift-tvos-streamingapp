//
//  TestChannelsPresenter.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import XCTest
import AppResources
@testable import iTV_Plus

class TestChannelsPresenter: XCTestCase {
    
    var sut: ChannelsPresenter!
    var mockInteractor: MockChannelsInteractor!
    var mockWireframe: MockChannelsWireFrame!
    var mockViewModel: MockChannelViewModel!
    
    override func setUp() {
        mockInteractor = MockChannelsInteractor()
        mockWireframe = MockChannelsWireFrame()
        mockViewModel = MockChannelViewModel()
        sut = ChannelsPresenter()
        sut.wireFrame = mockWireframe
        sut.interactor = mockInteractor
        sut.wireFrame = mockWireframe
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockWireframe = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    func testChannelsPresenter_WhenChannelsProvided_ShouldNotThrowAnError() {
        let stringValue = "One"
        let channel = Channel(id: 0, title: stringValue, color: stringValue, url: stringValue)
        XCTAssertNoThrow(try! sut.presentCategory(with: channel))
    }
    
    
    
}

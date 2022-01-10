//
//  TestChannelsListView.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import XCTest
import SwiftUI
import AppResources
@testable import iTV_Plus

class TestChannelsListView: XCTestCase {
    
    var sut: ChannelsListView!
    @State var mockPresenter: ChannelsPresenterInterface!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockChannelPresenter()
        sut = ChannelsListView(presenter: $mockPresenter, channels: FakeChannels.developmentChannels)
    }
    
    override func tearDown() {
        mockPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    func testChannelsListView_WhenValidChannelsProvided_ShouldReturnChannelsNoError() {
        let channels = FakeChannels.developmentChannels
        do {
            let result = try sut.provideChannels(from: channels)
            XCTAssertNotNil(result)
        } catch {}
        
    }
    
    func testChannelsListView_WhenInValidChannelsReceived_ShouldThrowError() {
        do {
            let result = try sut.provideChannels(from: nil)
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.invalidChannelList.localizedDescription)
        }
    }
    
    func testChannelsListView_WhenCorrectURLStringProvided_ShouldReturnURLAndNoError() {
        let urlString = "https://google.com"
        do {
            let url = try sut.getURL(from: urlString)
            XCTAssertNotNil(url)
        } catch {}
    }
    
    func testChannelsListView_WhenBAsURLStringProvided_ShouldThrowError(){
        let urlString = ""
        do {
            let url = try sut.getURL(from: urlString)
            XCTAssertNil(url)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.failedToLoadURL.localizedDescription)
        }
    }

}

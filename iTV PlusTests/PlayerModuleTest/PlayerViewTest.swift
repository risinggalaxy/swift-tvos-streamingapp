//
//  PlayerViewTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import XCTest
import AppResources
@testable import iTV_Plus

class PlayerViewTest: XCTestCase {
    
    var sut: PlayerView!
    var mockPresenter: MockPlayerModulePresenter!
    var mockViewModel: MockPlayerViewModel!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockPlayerModulePresenter()
        mockViewModel = MockPlayerViewModel()
        sut = PlayerView(presenter: mockPresenter, viewModel: mockViewModel, screen: .zero)
    }
    
    override func tearDown() {
        mockPresenter = nil
        mockViewModel = nil
        sut = nil
        super.tearDown()
    }
    
    func testPlayerView_WhenReceivesValidChannel_ShouldUnwrapAndReturnChannel() {
        let channel = Channel(id: 0, title: "One", color: "One", url: "One")
        let result = try! sut.playingChannel(channel)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, channel.id)
        XCTAssertEqual(result.title, channel.title)
        XCTAssertEqual(result.color, channel.color)
        XCTAssertEqual(result.url, channel.url)
    }
    
    func testPlayerView_WhenReceivesValidString_ShouldReturnURL() {
        let string = "https://risinggalaxy.com/"
        let result = try! sut.channelUrl(from: string)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.host, "risinggalaxy.com")
        XCTAssertEqual(result.scheme, "https")
    }
    
    func testPlayerView_WhenReceivesInvalidChannel_ShouldThrowAnError() {
        do {
            let result = try sut.playingChannel(nil)
            XCTAssertThrowsError(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.invalidChannel.localizedDescription)
        }
    }
    
    func testPlayerView_WhenReceivesInvalidString_ShouldThrowAnError() {
        do {
            let result = try sut.channelUrl(from:"")
            XCTAssertThrowsError(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.failedToLoadURL.localizedDescription)
        }
    }
    
}

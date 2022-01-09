//
//  TestChannelsView.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import XCTest
import AppResources
@testable import iTV_Plus

class TestChannelsView: XCTestCase {
    
    
    var sut: ChannelsView!
    var mockPresenter: MockChannelPresenter!
    var mockViewModel: MockChannelViewModel!
    
    override func setUp() {
        mockPresenter = MockChannelPresenter()
        mockViewModel = MockChannelViewModel()
        sut = ChannelsView(presenter: mockPresenter, viewModel: mockViewModel, parentCategory: ("Test", "❤️"))
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockViewModel = nil
        super.tearDown()
    }
    
    func testChannelView_WhenChannelsReceived_ReturningResultShouldNotBeNil() {
        let testString = "One"
        let channels = [Channel(id: 0, title: testString, color: testString, url: testString)]
        let result = try! sut.provideChannels(from: channels)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 1)
        guard let firstChannel = channels.first else { return }
        XCTAssertEqual(firstChannel.id, 0)
        XCTAssertEqual(firstChannel.title, testString)
        XCTAssertEqual(firstChannel.color, testString)
        XCTAssertEqual(firstChannel.url, testString)
        
    }
    
    func testChannelView_WhenInvalidChannelsGiven_ShouldThrowAnError() {
        do {
            let result = try sut.provideChannels(from: nil)
            XCTAssertThrowsError(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, ErrorHandler.invalidChannelList.localizedDescription)
        }
    }
    
}

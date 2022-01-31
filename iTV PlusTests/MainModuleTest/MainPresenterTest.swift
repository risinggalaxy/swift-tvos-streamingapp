//
//  MainPresenterTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import XCTest
import AppResources
@testable import iTV_Plus

class MainPresenterTest: XCTestCase {
    
    var sut: MainPresenter!
    var mockInteractor: MockMainInteractor!
    var mockViewModel: MockViewModel!
    var mockWireframe: MockMainWireFrame!
    
    override func setUp() {
        super.setUp()
        sut = MainPresenter()
        mockInteractor = MockMainInteractor()
        mockViewModel = MockViewModel()
        mockWireframe = MockMainWireFrame()
        sut.mainViewModel = mockViewModel
        sut.interactor = mockInteractor
        sut.wireFrame = mockWireframe
    }
    
    override func tearDown() {
        sut = nil
        mockInteractor = nil
        mockInteractor = nil
        mockViewModel = nil
        mockWireframe = nil
        super.tearDown()
    }
    
    func testMainPresenter_WhenCategoriesReceived_ShouldPushCategoriesToViewModel() {
        sut.updateViewModel(FakeCategories.categories)
        XCTAssertFalse(mockViewModel.categories.isEmpty)
    }
    
    
    func testMainPresenter_WhenPresentPlayerViewCalled_ShouldPassValuesToMainWireFrame() {
        
        sut.presentPlayerView(with: FakeChannels.movieChannels.first!)
        XCTAssertTrue(mockWireframe.didReceiveChannels)
        XCTAssertTrue(mockWireframe.didCallPresentChannelView)
        
    }
    
    func testMainPresenter_WhenPresentCategoryCalled_ShouldPassValuesToMainWireFrame() {
        sut.presentCategory(with: FakeCategories.categories.first!)
        XCTAssertTrue(mockWireframe.didReceiveCategory)
        XCTAssertTrue(mockWireframe.didCallPresentCategoryView)
    }
    
    func testMainPresenter_WhenPresenterRequestRefresh_ShouldCallStartDownloadOnInteractor() {
        XCTAssertFalse(mockInteractor.didCallStartDownloadOnRefreshRequest)
        XCTAssertEqual(mockInteractor.numbersDidCallStartDownloadOnRefreshRequest, 0)
        sut.refreshChannelData()
        XCTAssertTrue(mockInteractor.didCallStartDownloadOnRefreshRequest)
        XCTAssertEqual(mockInteractor.numbersDidCallStartDownloadOnRefreshRequest, 1)
    }
    
    func testMainPresenter_WhenRefreshNotificationPosted_ShouldCallRefreshChannelsdataFunction() {
        XCTAssertFalse(sut.didHandleNotificationCall)
        sut.notificationCenter = NotificationCenter.default
        NotificationCenter.default.post(name: kRefreshChannelsNotificationName, object: nil)
        XCTAssertTrue(sut.didHandleNotificationCall)
    }
    
    
    
}

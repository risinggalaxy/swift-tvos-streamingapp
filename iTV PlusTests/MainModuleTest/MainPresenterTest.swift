//
//  MainPresenterTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import XCTest
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
        XCTAssertTrue(mockViewModel.categories.isEmpty)
        sut.updateViewModel(FakeCategories.categories)
        XCTAssertFalse(mockViewModel.categories.isEmpty)
    }
    
}

//
//  MainWireFrameTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 28/12/2021.
//

import XCTest
import AppResources
import UIKit
@testable import iTV_Plus

class MainWireFrameTest: XCTestCase {
    
    var sut: MainWireFrame!
    
    override func setUp() {
        super.setUp()
        sut = MainWireFrame()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMainWireFrame_WhenPresentViewController_ShouldReturnMainViewAndNotNil() {
        let uiWindow = UIWindow(frame: UIScreen.main.bounds)
        let isVIEW = MainWireFrame.presentViewController(window: uiWindow)
        XCTAssertNotNil(isVIEW)
        XCTAssertEqual(isVIEW.title, "Main View")
    }
    
    func testMainWireFrame_WhenPresentChannelView_ShouldReturnTrue() {
        let result = sut.presentChannelView(with: FakeChannels.developmentChannels.first!)
        XCTAssertTrue(result)
    }
    
    func testMainWireFrame_WhenPresentCategory_ShouldReturnTrue() {
        let result = sut.presentCategory(with: FakeCategories.categories.first!)
        XCTAssertTrue(result)
    }
    
}

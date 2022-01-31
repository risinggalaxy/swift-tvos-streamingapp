//
//  TestITVPlusUI.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 10/01/2022.
//


import XCTest

class TestITVPlusUI: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = XCUIApplication().scrollViews.otherElements
        let firstElement = elementsQuery.buttons["1-1"].children(matching: .other).element
        XCTAssertTrue(firstElement.exists)
        XCTAssertFalse(firstElement.textViews.firstMatch.exists)
        XCTAssert(firstElement.hasFocus)
        XCUIRemote.shared.press(.select)
        XCUIRemote.shared.press(.menu)
        let firstChannel = elementsQuery.buttons["1-1"].children(matching: .other).element
        XCTAssertTrue(firstChannel.exists)
        XCTAssertFalse(firstChannel.textViews.firstMatch.exists)
        XCUIRemote.shared.press(.select)
        XCUIRemote.shared.press(.menu)
    }

}

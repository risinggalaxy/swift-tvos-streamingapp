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
        let element = elementsQuery.buttons["⚽️, Sports"].children(matching: .other).element
        XCTAssert(element.hasFocus)
        XCUIRemote.shared.press(.select)
        XCTAssert(elementsQuery.buttons["1, Sports One"].children(matching: .other).element.hasFocus)
        XCUIRemote.shared.press(.select)
        XCUIRemote.shared.press(.menu)
        XCUIRemote.shared.press(.menu)
        XCUIRemote.shared.press(.select, forDuration: 1.0)
        XCUIRemote.shared.press(.select)
        XCUIRemote.shared.press(.menu)
        
    }

}

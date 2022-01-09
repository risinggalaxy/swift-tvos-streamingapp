//
//  JSONParserTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import XCTest
import AppResources
@testable import iTV_Plus

class MainInteractorTest: XCTestCase {
    
    var sut: MainInteractor!
    var presenter: MockMainPresenter!
    
    override func setUp() {
        super.setUp()
        sut = MainInteractor()
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    func testMainInteractor_WhenParsingJSON_ReturnTypeShouldNotBeNil() {
        guard let data = mockJSON else { return }
        sut.loadJSON(data) { categories, error in
            if let receivedCategories = categories {
                XCTAssertNotNil(receivedCategories)
                XCTAssertNil(error)
            }
        }
    }
    
    func testMainInteractor_WhenParsingBadJSONData_ShouldThrowAnError() {
        guard let data = badJSONData else { return }
        sut.loadJSON(data) { categories, error in
            XCTAssertNil(categories)
            XCTAssertEqual(error, ErrorHandler.failedToParsJSON)
        }
    }

    func testMainInteractor_WhenParsingJSOND_CategoriesArrayShouldNotBeEmpty() {
        XCTAssertTrue(sut.categories.isEmpty)
        guard let data = mockJSON else { return }
        sut.loadJSON(data) { [weak self] categories, error in
            self?.sut.categories = categories
            XCTAssertNil(error)
        }
        XCTAssertFalse(sut.categories.isEmpty)
    }
}

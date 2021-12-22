//
//  JSONParserTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import XCTest
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
    
    
    func testMainInteractor_WhenParsingJSON_ShouldReturnTypeShouldNotBeNil() {
        guard let data = mockJSON else { return }
        let categories: [Categories] = try! sut.loadJSON(data)
        XCTAssertNotNil(categories)
    }
    
    func testMainInteractor_WhenParsingBadJSONData_ShouldThrowAnError() {
        guard let data = badJSONData else { return }
        var categories: [Categories] = []
        do {
            categories = try sut.loadJSON(data)
            XCTAssertThrowsError(categories)
        } catch {}
    }
    
    func testMainInteractor_WhenParsingJSOND_CategoriesArrayShouldNotBeEmpty() {
        XCTAssertTrue(sut.categories.isEmpty)
        guard let data = mockJSON else { return }
        do {
            sut.categories = try sut.loadJSON(data)
            XCTAssertNotNil(sut.categories)
            XCTAssertTrue(!sut.categories.isEmpty)
        } catch {}
    }
    
}

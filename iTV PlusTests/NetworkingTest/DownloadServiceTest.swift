//
//  DownloadServiceTest.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 23/12/2021.
//

import XCTest
@testable import iTV_Plus

class DownloadServiceTest: XCTestCase {
    
    var sut: DownloadService!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = DownloadService(urlSession: urlSession, urlString: URLString.urlString)
    }
    
    override func tearDown() {
        sut = nil
        MockURLProtocol.stubJSONData = nil
        MockURLProtocol.error = nil
        super.tearDown()
    }

    
    func testDownloadServiceTest_WhenEmptyURLStringProvided_ErrorHappens() {
        let expectation = expectation(description: "An Empty String Provided")
        sut = DownloadService(urlString:"")
        sut.downloader { (data, error) in
            XCTAssertNil(data)
            XCTAssertEqual(error, ErrorHandler.failedRequest(description: "Bad URL"))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDownloadServiceTest_WhenURLRequestFailsWithCorruptData_ErrorHappens() {
        let expectation = expectation(description: "Wrong File Path Provided")
        let errorDescription = "Corrupt Data"
        MockURLProtocol.error = ErrorHandler.failedRequest(description: errorDescription)
        MockURLProtocol.stubJSONData = nil
        sut.downloader { (data, error) in
            XCTAssertNil(data)
            XCTAssertEqual(error, ErrorHandler.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testDownloadServiceTest_WhenDataReceived_ShouldPass() {
        let expectation = expectation(description: "Data Was Received")
        guard let receivedData = mockJSON else { return }
        MockURLProtocol.stubJSONData = receivedData
        sut.downloader { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
    }
}

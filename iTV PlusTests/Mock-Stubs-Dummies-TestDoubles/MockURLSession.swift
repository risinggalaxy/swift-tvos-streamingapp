//
//  MockURLSession.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

class MockURLSession: URLProtocol {
    
    override class func canInit(with request: URLRequest) -> Bool {
        super.canInit(with: request)
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        super.canonicalRequest(for: request)
        return request
    }
    
    override func startLoading() {
        super.startLoading()
    }
    
    override func stopLoading() {
        super.stopLoading()
    }
    
    
}

//
//  MockDownloadService.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 28/01/2022.
//

import Foundation
import AppResources
@testable import iTV_Plus

class MockDownloadService: DownloadServiceInterface {
    
    var urlSession: URLSession
    var urlString: String = ""
    
    init(urlSession: URLSession, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
    }
    
    
}

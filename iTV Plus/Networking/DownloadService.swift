//
//  DownloadService.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 23/12/2021.
//

import Foundation

class DownloadService: DownloadServiceInterface {
    
    internal var urlSession: URLSession
    internal var urlString: String
    
    init(urlSession: URLSession = .shared, urlString: String){
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void) {
        guard let url = URL(string: self.urlString) else {
            completionHandler(nil, ErrorHandler.failedRequest(description: "Bad URL"))
            return
        }
        let urlRequest = URLRequest(url: url)
        let dataTask = self.urlSession.dataTask(with: urlRequest) { (data, _, error) in
            guard let receivedData = data else {
                completionHandler(nil, ErrorHandler.failedRequest(description: "Corrupt Data"))
                return
            }
            completionHandler(receivedData, nil)
        }
        dataTask.resume()
    }
}

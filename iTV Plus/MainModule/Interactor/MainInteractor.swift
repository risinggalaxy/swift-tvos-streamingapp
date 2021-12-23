//
//  MainInteractor.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

class MainInteractor: MainInteractorInterface {
    
    var urlSession: URLSession?
    var presenter: MainPresenterInterface?
    var downloadService: DownloadService?
    var categories: [Categories]! = [] {
        didSet {
            presenter?.updateViewModel(categories)
        }
    }
    
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.downloadService = DownloadService(urlSession: urlSession, urlString: URLString.urlString)
        startDownload(with: downloadService!)
     
    }
    
    func startDownload(with downloadService: DownloadService ) {
        downloadService.downloader { [weak self] data, error in
            if let receivedError = error {
                self?.presenter?.notifyViewWithError(message: "Failed To Connect To The Server With: \(receivedError)")
            }
            if let receivedData = data {
                self?.loadJSON(receivedData, completionHandler: { [weak self] categories, error in
                    if let receivedError = error {
                        self?.presenter?.notifyViewWithError(message: "Failed To Load Channels With: \(receivedError)")
                    }
                    if let receiveCategories = categories {
                        self?.categories = receiveCategories
                    }
                })
            }
        }
    }
    
    func loadJSON( _ data: Data, completionHandler: @escaping ([Categories]?, ErrorHandler?) -> Void) {
        let decoder = JSONDecoder()
        do {
            completionHandler(try decoder.decode([Categories].self, from: data), nil)
        } catch {
            completionHandler(nil, ErrorHandler.failedToParsJSON)
        }
    }
}

//
//  MainInteractor.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

class MainInteractor: MainInteractorInterface {
    
    var urlSession: URLSession?
    var presenter: MainPresenterInterface?
    var downloadService: DownloadService?
    var categories: [ITVCategory]! = [] {
        didSet {
            presenter?.updateViewModel(categories)
        }
    }
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.downloadService = DownloadService(urlSession: urlSession, urlString: ChannelsDownloadURL.urlString)
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
                        self?.presenter?.notifyViewWithError(message: "Failed To Load Channels With: \(receivedError.localizedDescription)")
                    }
                    if let receiveCategories = categories {
                        self?.categories = receiveCategories
                    }
                })
            }
        }
    }
    
    func loadJSON( _ data: Data, completionHandler: @escaping ([ITVCategory]?, ErrorHandler?) -> Void) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([ITVCategory].self, from: data)
            completionHandler(decodedData, nil)
        } catch {
            completionHandler(nil, ErrorHandler.failedToParsJSON)
        }
    }
}

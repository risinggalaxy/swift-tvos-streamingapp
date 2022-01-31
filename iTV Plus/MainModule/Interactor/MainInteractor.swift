//
//  MainInteractor.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import Network
import AppResources

class MainInteractor: MainInteractorInterface {
    
    var urlSession: URLSession?
    var presenter: MainPresenterInterface?
    var downloadService: DownloadServiceInterface!
    var categories: [ITVCategory]! = [] {
        didSet {
            presenter?.updateViewModel(categories)
        }
    }
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.downloadService = DownloadService(urlSession: urlSession, urlString: ChannelsDownloadURL.urlString)
        startDownload()
    }
    
    fileprivate func extractingJSON(_ error: ErrorHandler?, _ categories: [ITVCategory]?) {
        if let receivedError = error {
            presenter?.notifyViewWithError(message: "Failed To Load Channels With: \(receivedError.localizedDescription)")
        }
        if let receiveCategories = categories {
            self.categories = receiveCategories
        }
    }
    
    func startDownload() {
       let networkManager = NetworkManager()
        downloadService.downloader { [weak self] data, error in
            guard let strongSelf = self else { return }
            if let receivedError = error {
                if networkManager.hasConnection {
                    strongSelf.presenter?.notifyViewWithError(message: "Failed To Connect To The Server With: \(receivedError)")
                } else {
                    print("STATUS \(networkManager.hasConnection)")
                    strongSelf.loadJSON(mockJSON!) { categories, error in
                        strongSelf.extractingJSON(error, categories)
                        strongSelf.presenter?.notifyViewWithError(message: "Please check your internet connection")
                    }
                }
            }
            if let receivedData = data {
                strongSelf.loadJSON(receivedData, completionHandler: { categories, error in
                    strongSelf.extractingJSON(error, categories)
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

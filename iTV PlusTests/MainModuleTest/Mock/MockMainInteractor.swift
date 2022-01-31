//
//  MockMainInteractor.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import Network
import AppResources

@testable import iTV_Plus

class MockMainInteractor: MainInteractorInterface {

    var networkPathMonitor: NetworkManager!
    var urlSession: URLSession?
    var downloadService: DownloadServiceInterface!
    var didPushUpdateToPresenter: Bool = false
    var presenter: MainPresenterInterface?
    var categories: [ITVCategory]! = [] {
        didSet {
            if !categories.isEmpty {
                presenter?.updateViewModel(categories)
                didPushUpdateToPresenter = true
            }
        }
    }
    
    var didCallStartDownloadOnRefreshRequest: Bool = false
    var numbersDidCallStartDownloadOnRefreshRequest: Int = 0
    
    var didPassDataToPresenter: Bool?
    
    func startDownload() {
        didCallStartDownloadOnRefreshRequest = true
        numbersDidCallStartDownloadOnRefreshRequest += 1
    }

    func loadJSON(_ data: Data, completionHandler: @escaping ([ITVCategory]?, ErrorHandler?) -> Void) {
    }
    
}

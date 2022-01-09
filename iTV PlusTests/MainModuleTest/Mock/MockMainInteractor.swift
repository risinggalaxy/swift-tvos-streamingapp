//
//  MockMainInteractor.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

@testable import iTV_Plus

class MockMainInteractor: MainInteractorInterface {
    
    var urlSession: URLSession?
    var downloadService: DownloadService?
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
    
    var didPassDataToPresenter: Bool?
    
    
    func loadJSON(_ data: Data, completionHandler: @escaping ([ITVCategory]?, ErrorHandler?) -> Void) {
    }
    
    
}

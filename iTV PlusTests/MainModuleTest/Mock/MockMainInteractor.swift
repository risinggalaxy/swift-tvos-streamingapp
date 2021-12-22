//
//  MockMainInteractor.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
@testable import iTV_Plus

class MockMainInteractor: MainInteractorInterface {
    
    var didPushUpdateToPresenter: Bool = false
    
    var presenter: MainPresenterInterface?
    var categories: [Categories]! = [] {
        didSet {
            if !categories.isEmpty {
                presenter?.updateViewModel(categories)
                didPushUpdateToPresenter = true
            }
        }
    }
    
    var didPassDataToPresenter: Bool?
    
    func loadJSON<T: Codable>(_ data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(T.self, from: data)
    }
    
}

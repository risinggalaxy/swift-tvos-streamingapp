//
//  MainInteractor.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

class MainInteractor: MainInteractorInterface {
    var presenter: MainPresenterInterface?
    var categories: [Categories]! = [] {
        didSet {
            if !categories.isEmpty {
                //TODO: Pass Data to Presenter
            } else {
                //TODO: Update View
            }
        }
    }
    func loadJSON<T: Codable>( _ data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ErrorHandler.failedToParsJSON
        }
    }
}

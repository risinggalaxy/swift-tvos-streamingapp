//
//  MainInteractorInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

protocol MainInteractorInterface {
    var presenter: MainPresenterInterface? { get set }
    var categories: [Categories]! { get set }
    func loadJSON<T: Codable>( _ data: Data) throws -> T
}

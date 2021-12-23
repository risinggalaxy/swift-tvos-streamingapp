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
    var urlSession: URLSession? { get set }
    var downloadService: DownloadService? { get set }
    func loadJSON( _ data: Data, completionHandler: @escaping ([Categories]?, ErrorHandler?) -> Void)
}

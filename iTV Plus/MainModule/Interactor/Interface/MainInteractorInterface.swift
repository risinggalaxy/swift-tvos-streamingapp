//
//  MainInteractorInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import Network
import AppResources

protocol MainInteractorInterface {
    var presenter: MainPresenterInterface? { get set }
    var categories: [ITVCategory]! { get set }
    var urlSession: URLSession? { get set }
    var downloadService: DownloadServiceInterface! { get set }
    func startDownload()
    func loadJSON( _ data: Data, completionHandler: @escaping ([ITVCategory]?, ErrorHandler?) -> Void)
}

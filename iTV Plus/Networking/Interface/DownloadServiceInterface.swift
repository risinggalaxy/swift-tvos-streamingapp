//
//  DownloadServiceInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 23/12/2021.
//

import Foundation
import AppResources

protocol DownloadServiceInterface {
    var urlSession: URLSession { get set }
    var urlString: String { get set }
    func downloader(completionHandler: @escaping (Data?, ErrorHandler?) -> Void)
}

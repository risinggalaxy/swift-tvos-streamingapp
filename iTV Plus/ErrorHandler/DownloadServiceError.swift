//
//  DownloadServiceError.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 23/12/2021.
//

import Foundation

enum DownloadServiceError: LocalizedError, Equatable {
    case    invalidURLString,
            failed
}

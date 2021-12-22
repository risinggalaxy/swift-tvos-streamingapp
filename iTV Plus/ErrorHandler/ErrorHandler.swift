//
//  ErrorHandler.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

enum ErrorHandler: Error {
    case    failedToLoadURL,
            failedToParsJSON,
            failedToRefreshData
}

//
//  ErrorHandler.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

enum ErrorHandler: LocalizedError, Equatable {
    case    failedToLoadURL,
            failedToParsJSON,
            failedToRefreshData,
            failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedToParsJSON: return "Failed To Load JSON, Probably Bad JSON File"
        case .failedToLoadURL: return "Failed To Load URL, Probably Bad URL Address"
        case .failedToRefreshData: return "Failed To Refresh Data"
        case .failedRequest(let description): return description
        }
    }
}

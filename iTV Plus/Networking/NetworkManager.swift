//
//  NetworkManager.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 31/01/2022.
//

import Network
import Foundation

class NetworkManager {
    let networkMonitor = NWPathMonitor()
    let networkQueue = DispatchQueue(label: "NetworkMonitor")
    var hasConnection: Bool = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { [weak self] in
                switch path.status {
                case .satisfied: self?.hasConnection = true
                case .unsatisfied: self?.hasConnection = false
                default:
                    break
                }
            }
        }
        networkMonitor.start(queue: networkQueue)
    }
    
}

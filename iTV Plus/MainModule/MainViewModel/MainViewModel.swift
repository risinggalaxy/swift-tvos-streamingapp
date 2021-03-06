//
//  MainViewModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI
import AppResources

class MainViewModel: ObservableObject, MainViewModelInterface {
    
    let objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    var viewTitle: String?
    
    @Published var categories: [ITVCategory] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.objectWillChange.send()
            }
        }
    }
    
    @Published var errorMessage: String = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.objectWillChange.send()
            }
        }
    }
    
}

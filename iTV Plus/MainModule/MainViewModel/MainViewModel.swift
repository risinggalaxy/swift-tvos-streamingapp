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
    
    @Published var categories: [Categorie] = FakeCategories.categories {
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

//
//  MainPresenter.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

class MainPresenter: MainPresenterInterface {
    
    weak var mainViewModel: MainViewModel?
    var interactor: MainInteractorInterface?
    var wireFrame: MainWireFrameInterface?
    
    func updateViewModel(_ categories: [Categorie]) {
        mainViewModel?.categories = categories
    }
    
    func notifyViewWithError(message: String) {
        mainViewModel?.errorMessage = message
    }
    
    func presentPlayerView(with channel: Channel) {
        wireFrame?.presentChannelView(with: channel)
    }
    
    func presentCategory(with category: Categorie) {
        wireFrame?.presentCategory(with: category)
    }
    
}

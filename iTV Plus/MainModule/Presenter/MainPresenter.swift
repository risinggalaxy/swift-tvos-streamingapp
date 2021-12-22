//
//  MainPresenter.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

class MainPresenter: MainPresenterInterface {
    
    weak var mainViewModel: MainViewModel?
    var interactor: MainInteractorInterface?
    var wireFrame: MainWireFrameInterface?
    
}

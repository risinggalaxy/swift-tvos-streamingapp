//
//  MainPresenterInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import AppResources

protocol MainPresenterInterface {
    
    var mainViewModel: MainViewModel? { get set}
    var interactor: MainInteractorInterface? { get set }
    var wireFrame: MainWireFrameInterface? { get set }
    func updateViewModel( _ categories: [Categorie] )
    func notifyViewWithError(message: String)
    
}

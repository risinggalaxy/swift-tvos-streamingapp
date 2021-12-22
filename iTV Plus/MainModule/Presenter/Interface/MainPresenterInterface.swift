//
//  MainPresenterInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

protocol MainPresenterInterface {
    
    var mainViewModel: MainViewModel? { get set}
    var interactor: MainInteractorInterface? { get set }
    var wireFrame: MainWireFrameInterface? { get set }
    func updateViewModel( _ categories: [Categories] )
    
}

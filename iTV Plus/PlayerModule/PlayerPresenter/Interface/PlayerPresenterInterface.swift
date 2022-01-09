//
//  PlayerPresenterInterface.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

protocol PlayerPresenterInterface {
    var viewModel: PlayerViewModel? { get set }
    var interactor: PlayerInteractor? { get set }
    var wireFrame: PlayerWireFrame? { get set }
}

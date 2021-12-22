//
//  PlayerWireFrame.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
import SwiftUI

class PlayerWireFrame: PlayerWireFrameInterface {
    
    static func presentViewController() -> VIEW {
        let viewModel = PlayerViewModel()
        let presenter = PlayerPresenter()
        let interactor = PlayerInteractor()
        let wireFrame = PlayerWireFrame()
        let view = PlayerView(presenter: presenter, viewModel: viewModel)
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.viewModel = viewModel
        presenter.wireFrame = wireFrame
        let playerView = UIHostingController(rootView: view)
        return playerView
    }
}

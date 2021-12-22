//
//  MainWireFrame.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI

class MainWireFrame: MainWireFrameInterface {
    
    static func presentViewController() -> VIEW {
        let viewModel = MainViewModel()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let wireFrame = MainWireFrame()
        let view = MainView(presenter: presenter, mainViewModel: viewModel).environmentObject(MainEnvironmentalObject())
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.mainViewModel = viewModel
        presenter.wireFrame = wireFrame
        let mainView = UIHostingController(rootView: view)
        return mainView
    }
    
}

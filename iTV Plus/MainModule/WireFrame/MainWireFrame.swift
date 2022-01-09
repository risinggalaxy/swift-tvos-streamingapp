//
//  MainWireFrame.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI
import AppResources

class MainWireFrame: MainWireFrameInterface {
    
    static var rootView: VIEW?
    
    static func presentViewController(window: UIWindow) -> VIEW {
        //Clear Cache At Every App Launch
        StorageHandler.clear(.cache)
        let viewModel = MainViewModel()
        let interactor = MainInteractor()
        viewModel.viewTitle = "Main View"
        let presenter = MainPresenter()
        let wireFrame = MainWireFrame()
        let view = MainView(presenter: presenter, mainViewModel: viewModel).environmentObject(MainEnvironmentalObject())
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.mainViewModel = viewModel
        presenter.wireFrame = wireFrame
        let mainView = UIHostingController(rootView: view)
        mainView.title = viewModel.viewTitle
        MainWireFrame.rootView = mainView
        return mainView
    }
    
    
    func presentChannelView(with channel: Channel) -> Bool {
        guard let view = MainWireFrame.rootView else { return false}
        let newView = PlayerWireFrame.presentViewController(with: channel)
        view.present(newView, animated: true, completion: nil)
        return true
    }
    
    func presentCategory(with category: Categories) -> Bool {
        guard let view = MainWireFrame.rootView else { return false}
        let newView = ChannelsWireFrame.presentViewController(on: view, parentCategory: (category.title, category.icon), channels: category.channels)
        view.present(newView, animated: true, completion: nil)
        return true
    }
    
    
}

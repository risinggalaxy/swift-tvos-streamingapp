//
//  ChannelsWireFrame.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI
import AppResources

class ChannelsWireFrame: ChannelsWireFrameInterface {
    
    static var rootView: VIEW?
    
    static func presentViewController(on view: VIEW, parentCategory: (title: String, icon: String), channels: [Channel]) -> VIEW {
        let viewModel = ChannelsViewModel()
        let presenter = ChannelsPresenter()
        let interactor = ChannelsInteractor()
        let wireFrame = ChannelsWireFrame()
        let view = ChannelsView(presenter: presenter, viewModel: viewModel, parentCategory: parentCategory)
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        presenter.channelsViewModel = viewModel
        viewModel.channels = channels
        let channelsView = UIHostingController(rootView: view)
        ChannelsWireFrame.rootView = channelsView
        return channelsView
    }
    
    func presentPlayer(with channel: Channel) throws {
        guard let view = ChannelsWireFrame.rootView else {
            throw ErrorHandler.noParentViewWasFound
        }
        let playerView  = PlayerWireFrame.presentViewController(with: channel)
        view.present(playerView, animated: true, completion: nil)
    }
    
}

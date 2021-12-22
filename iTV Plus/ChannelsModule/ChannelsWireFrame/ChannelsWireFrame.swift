//
//  ChannelsWireFrame.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI

class ChannelsWireFrame: ChannelsWireFrameInterface {
    
    static func presentViewController() -> VIEW {
        let viewModel = ChannelsViewModel()
        let presenter = ChannelsPresenter()
        let interactor = ChannelsInteractor()
        let wireFrame = ChannelsWireFrame()
        let view = ChannelsView(presenter: presenter, viewModel: viewModel)
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        presenter.channelsViewModel = viewModel
        let channelsView = UIHostingController(rootView: view)
        return channelsView
    }
    
}

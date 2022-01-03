//
//  PlayerView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AVKit
import AppResources

struct PlayerView: View, PlayerViewInterface {
    
    var presenter: PlayerPresenterInterface?
    @ObservedObject var viewModel: PlayerViewModel
    var screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            VideoPlayer(player: AVPlayer(url:try! channelUrl(from: playingChannel(viewModel.playingChannel).url)))
                .frame(width: screen.width, height: screen.height, alignment: .center)
            VStack(alignment: .leading, spacing: 10) {
                Text(try! playingChannel(viewModel.playingChannel).title)
                    .font(.system(size: 30, weight: .bold, design: .default))
                Spacer()
            }
        }
    }
    
    internal func playingChannel( _ channel: Channel?) throws -> Channel {
        guard let outputChannel = channel else {
            throw ErrorHandler.invalidChannel
        }
        return outputChannel
    }
    
    internal func channelUrl( from string: String) throws -> URL {
        guard let url = URL(string: string) else {
            throw ErrorHandler.failedToLoadURL
        }
        return url
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: PlayerViewModel())
    }
}

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
    var screen = UIScreen.main.bounds
    @State var avPlayer: AVPlayer?
    @State var didSetPlayer: Bool = false
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            VideoPlayer(player: didSetPlayer ? avPlayer : nil)
                .frame(width: screen.width, height: screen.height, alignment: .center)
        }.onAppear {
            shouldSetPlayer()
        }
    }
    
    internal func shouldSetPlayer() {
        avPlayer = AVPlayer(url:try! channelUrl(from: playingChannel(viewModel.playingChannel).url))
        didSetPlayer = true
        avPlayer!.play()
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

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView(viewModel: PlayerViewModel())
//    }
//}

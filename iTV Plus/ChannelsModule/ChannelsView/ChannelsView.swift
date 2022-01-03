//
//  ChannelsView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AppResources

struct ChannelsView: View, ChannelsViewInterface {
    
    var presenter: ChannelsPresenterInterface?
    
    @ObservedObject var viewModel: ChannelsViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(try! provideChannels(from: viewModel.channels)) { channel in
                    Button {
                        try! presenter?.presentCategory(with: channel)
                    } label: {
                        Text(channel.title)
                    }
                }
            }.fullWidth(with: 500)
        }
    }
    
    internal func provideChannels(from channels: [Channel]?) throws -> [Channel] {
        guard let outputChannels = channels else  {
            throw ErrorHandler.invalidChannelList
        }
        return outputChannels
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView(viewModel: ChannelsViewModel())
        
    }
}



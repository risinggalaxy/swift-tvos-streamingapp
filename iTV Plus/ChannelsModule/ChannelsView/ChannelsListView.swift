//
//  ChannelsListView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 10/01/2022.
//

import SwiftUI
import AppResources

struct ChannelsListView: View {
    
    @Binding var presenter: ChannelsPresenterInterface?
    @State var channels: [Channel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(try! provideChannels(from: channels)) { channel in
                    Button {
                        try! presenter?.presentCategory(with: channel)
                    } label: {
                        ChannelsCellDesign(channel: channel)
                    }
                    .buttonStyle(CardButtonStyle())
                    
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
    
    internal func getURL(from string: String) throws -> URL {
        guard let channelURL = URL(string: string) else {
            throw ErrorHandler.failedToLoadURL
        }
        return channelURL
    }
}

struct ChannelsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsPreviewBinder()
    }
}

struct ChannelsPreviewBinder: View {
    
    @State var presenter: ChannelsPresenterInterface?
    @State var channels: [Channel] = FakeChannels.developmentChannels
    
    var body: some View {
        
        ChannelsListView(presenter: $presenter, channels: channels)
    }
    
}

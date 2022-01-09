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
    
    @State var parentCategory: (title: String, icon: String)
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(parentCategory.icon)
                        .font(.system(size: 200))
                    Text(parentCategory.title)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .foregroundColor(Color(UIColor(named: "titleColor")!))
                    
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center) {
                        ForEach(try! provideChannels(from: viewModel.channels)) { channel in
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

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView(viewModel: ChannelsViewModel(), parentCategory:(title: "Test", icon: "❤️"))
    }
}



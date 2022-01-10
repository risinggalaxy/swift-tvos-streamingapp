//
//  ChannelsView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI
import AppResources

struct ChannelsView: View, ChannelsViewInterface {
    
    @State var presenter: ChannelsPresenterInterface?
    
    @ObservedObject var viewModel: ChannelsViewModel
    
    @State var parentCategory: (title: String, icon: String)
    
    var body: some View {
        ZStack {
            VStack {
                ChannelsIdentView(parentCategory: parentCategory)
                ChannelsListView(presenter: $presenter, channels: provideChannels(viewModel.channels))
            }
        }
    }
    
    internal func provideChannels(_ from: [Channel]? ) -> [Channel] {
        guard let channels = from else {
            fatalError(ErrorHandler.invalidChanel.localizedDescription)
        }
        return channels
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView(viewModel: ChannelsViewModel(), parentCategory:(title: "Test", icon: "❤️"))
    }
}



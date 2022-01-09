//
//  MockChannelView.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 03/01/2022.
//

import SwiftUI
import AppResources
@testable import iTV_Plus

struct MockChannelsView: View, ChannelsViewInterface {
    
    var presenter: ChannelsPresenterInterface?
    @StateObject var viewModel: ChannelsViewModel
    
    var body: some View {
        Text("Mock")
    }
    
    func provideChannels(from channels: [Channel]?) throws -> [Channel] {
        let channels: [Channel] = []
        return channels
    }
    
}

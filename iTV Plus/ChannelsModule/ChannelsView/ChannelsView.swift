//
//  ChannelsView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI

struct ChannelsView: View, ChannelsViewInterface {
    
    var presenter: ChannelsPresenterInterface?
    
    @ObservedObject var viewModel: ChannelsViewModel
    
    var body: some View {
        Text("Channels View")
    }
}

struct ChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsView(viewModel: ChannelsViewModel())

    }
}

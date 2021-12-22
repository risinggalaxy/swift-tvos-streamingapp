//
//  PlayerView.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import SwiftUI

struct PlayerView: View, PlayerViewInterface {
    
    var presenter: PlayerPresenter?
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: PlayerViewModel())
    }
}

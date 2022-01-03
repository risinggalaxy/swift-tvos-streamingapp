//
//  PlayerVieModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import SwiftUI
import AppResources

class PlayerViewModel: ObservableObject, PlayerViewModelInterface {
    
    let objectWillChange = ObservableObjectPublisher()
    
    var playingChannel: Channel? {
        willSet {
            self.objectWillChange.send()
        }
    }
}


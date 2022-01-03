//
//  ChannelsViewModel.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Combine
import AppResources

class ChannelsViewModel: ObservableObject, ChannelsViewModelInterface {
    
    let objectWillChange = ObservableObjectPublisher()
    
    var channels: [Channel]? {
        willSet {
            self.objectWillChange.send()
        }
    }
    
}

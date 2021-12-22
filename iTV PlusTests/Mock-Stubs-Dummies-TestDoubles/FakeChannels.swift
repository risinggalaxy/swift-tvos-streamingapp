//
//  FakeChannels.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
@testable import iTV_Plus

struct FakeChannels {
    
    static let developmentChannels: [Channels] = [
        Channels(id: 1, title: "UIKit", image: "test_image_three"),
        Channels(id: 2, title: "SwiftUI", image: "test_image_one"),
        Channels(id: 3, title: "MVC", image: "test_image_two"),
        Channels(id: 4, title: "VIPER", image: "test_image_one"),
        Channels(id: 5, title: "MVP", image: "test_image_three"),
        Channels(id: 6, title: "MVVM", image: "test_image_one"),
        Channels(id: 7, title: "ARKit", image: "test_image_two")
    ]
    
    static let designChannels: [Channels] = [
        Channels(id: 1, title: "Photoshop", image: "test_image_two"),
    ]
    
    static let mindfullnessChannels: [Channels] = [
        Channels(id: 1, title: "Yoga", image: "test_image_three")
    ]
    
    static let sportChannels: [Channels] = [
        Channels(id: 1, title: "ESPN", image: "test_image_one"),
        Channels(id: 2, title: "FOX", image: "test_image_two")
    ]
    
    static let movieChannels: [Channels] = [
        Channels(id: 1, title: "Action", image: "test_image_two"),
        Channels(id: 2, title: "Thriller", image: "test_image_three")
    ]
}

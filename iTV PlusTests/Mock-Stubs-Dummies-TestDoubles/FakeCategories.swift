//
//  FakeCategories.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation
@testable import iTV_Plus

struct FakeCategories {
    static let categories: [Categories] = [
        Categories(id: 1, title: "Development", image: "test_image_two", channels: FakeChannels.developmentChannels),
        Categories(id: 2, title: "Design", image: "test_image_three", channels: FakeChannels.designChannels),
        Categories(id: 3, title: "Mindfulness", image: "test_image_one", channels: FakeChannels.mindfullnessChannels),
        Categories(id: 4, title: "Sports", image: "test_image_three", channels: FakeChannels.sportChannels),
        Categories(id: 5, title: "Movies", image: "test_image_one", channels: FakeChannels.movieChannels)
    ]
}

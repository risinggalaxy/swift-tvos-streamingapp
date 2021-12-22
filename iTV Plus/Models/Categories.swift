//
//  Categories.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

struct AllListInfo: Codable, Identifiable {
    let id: Int
    let categories: [Categories]
}

struct Categories: Codable, Identifiable {
    let id: Int
    let title: String
    let image: Data?
    let channels: [Channels]
}

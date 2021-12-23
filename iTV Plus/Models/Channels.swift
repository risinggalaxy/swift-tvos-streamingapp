//
//  Channels.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

struct Channels: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let url: String
}

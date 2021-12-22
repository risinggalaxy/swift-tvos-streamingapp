//
//  File.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

struct Channels: Codable, Identifiable {
    let id: Int
    let title: String
    let image: Data?
}

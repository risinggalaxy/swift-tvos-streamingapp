//
//  ImageData.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

struct MockImageData {
    static let mockImageData:Data = {
        let imageUrl = Bundle.main.url(forResource: "testImage", withExtension: "png")!
        let data = try! Data(contentsOf: imageUrl)
        return data
    }()
}

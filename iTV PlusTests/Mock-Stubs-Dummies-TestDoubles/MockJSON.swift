//
//  MockJSON.swift
//  iTV PlusTests
//
//  Created by YASSER FARAHI on 22/12/2021.
//

import Foundation

let mockJSON = """
[
{
  "id": 1,
  "title": "Sports",
  "image": "test_image_one.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_two.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_three.png"
   }
    ]
},
{
  "id": 2,
  "title": "Movies",
  "image": "test_image_two.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_one.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_three.png"
   }
    ]
},
{
  "id": 3,
  "title": "Development",
  "image": "test_image_three.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_two.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_one.png"
   }
]
}
]
""".data(using: .utf8)

let badJSONData = """
[
{
  "id": 1,
  "title": "Sports",
  "image": "test_image_one.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_two.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_three.png"
   }
    ]
}
{
  "id": 2,
  "title": "Movies",
  "image": "test_image_two.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_one.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_three.png"
   }
    ]
},
{
  "id": 3,
  "title": "Development",
  "image": "test_image_three.png",
  "channels": [
   {
  "id": 1,
  "title": "Sports One",
  "image": "test_image_two.png"
   },
   {
  "id": 2,
  "title": "Sports Two",
  "image": "test_image_one.png"
   }
]
}
]
""".data(using: .utf8)

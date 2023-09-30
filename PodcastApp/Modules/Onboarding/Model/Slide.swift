//
//  Slide.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 30.09.2023.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let secontTitle: String
    
    static let collection: [Slide] = [
        Slide(imageName: "1", title: "111", secontTitle: "222"),
        Slide(imageName: "2", title: "333", secontTitle: "444"),
        Slide(imageName: "3", title: "555", secontTitle: "666")
    ]
}

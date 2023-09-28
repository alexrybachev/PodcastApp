//
//  Source.swift
//  PodcastApp
//
//  Created by Admin on 28.09.2023.
//

import UIKit

struct Channel {
    let name: String
#warning("Change UIColor to UIImage")
    let image: UIColor
    let numberOfEpizode: String
    let totalTime: String
}

struct Source {
    static func makeChanel() -> [Channel]{
        [
            .init(name: "Between love and career", image: .systemPink, numberOfEpizode: "56 Eps", totalTime: "56:38"),
            .init(name: "The powerful way to move on", image: .cyan, numberOfEpizode: "55 Eps", totalTime: "58:40"),
            .init(name: "Monkey love makes me curious", image: .blue, numberOfEpizode: "54 Eps", totalTime: "1:40:40"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
            .init(name: "My love is blocked by Covid-19", image: .systemBlue, numberOfEpizode: "53 Eps", totalTime: "1:45:20"),
        ]
    }
}

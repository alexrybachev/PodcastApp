//
//  File.swift
//  PodcastApp
//
//  Created by Elizaveta Eremyonok on 29.09.2023.
//

import UIKit

struct Track {
    let title: String
    let image: UIImage
    let numberOfEpisodes: String
}

struct Source {
    static func makeTracks() -> [Track] {
        [
            .init(title: "Tuhan mengapa dia berbeda", image: UIImage(named: "ellipses")!, numberOfEpisodes: "15 Eps"),
            .init(title: "Everyone want to be a superhero", image: UIImage(named: "ellipses")!, numberOfEpisodes: "55 Eps"),
            .init(title: "Hobo man", image: UIImage(named: "ellipses")!, numberOfEpisodes: "54 Eps"),
            .init(title: "Love and Friends", image: UIImage(named: "ellipses")!, numberOfEpisodes: "53 Eps"),
            .init(title: "Friens but Married", image: UIImage(named: "ellipses")!, numberOfEpisodes: "15 Eps"),
            .init(title: "Everyone want to be a superhero", image: UIImage(named: "ellipses")!, numberOfEpisodes: "55 Eps"),
            .init(title: "Hobo man", image: UIImage(named: "ellipses")!, numberOfEpisodes: "54 Eps"),
            .init(title: "Love and Friends", image: UIImage(named: "ellipses")!, numberOfEpisodes: "53 Eps")
        ]
    }
}

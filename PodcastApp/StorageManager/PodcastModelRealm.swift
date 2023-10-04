//
//  PodcastModelRealm.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 04.10.2023.
//

import Foundation
import RealmSwift

class PodcastModel: Object {
    @Persisted var id = 0
    @Persisted var title = ""
    @Persisted var author = ""
    @Persisted var imageURL = ""
    
    convenience init(id: Int, title: String, author: String, imageURL: String) {
        self.init()
        self.id = id
        self.title = title
        self.author = author
        self.imageURL = imageURL
    }
}

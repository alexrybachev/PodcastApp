//
//  StorageManager.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 04.10.2023.
//

import Foundation
import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    
    private let realm = try! Realm()
    private var favorites: Results<PodcastModel>!
    
    private init() {}
    
    func save(podcast: PodcastModel) {
        try! realm.write {
            realm.add(podcast)
        }
    }
    
    func delete(podcast: PodcastModel) {
        try! realm.write {
            realm.delete(podcast)
        }
    }
    
    func read(completion: @escaping(Results<PodcastModel>) -> Void) {
        favorites = realm.objects(PodcastModel.self)
        DispatchQueue.main.async {
            completion(self.favorites)
        }
    }
    
    func isSaved(for id: Int) -> Bool {
        let object = realm.objects(PodcastModel.self).filter("id == %d", id).first
        return object != nil
    }

}

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
    
//    private var userInfo: Results<UserInfo>!
    
    private var favorites: Results<PodcastModel>!
    
    private var isUserSaved = false
    private(set) var currentUser: UserInfo?
    
    // MARK: - Initial
    
    private init() {}
    
    // MARK: - Methods for User

    func saveUser(_ user: UserInfo) {
        try! realm.write {
            currentUser = user
            realm.add(user)
        }
    }
    
    func checkedUser(for email: String?, with userName: String? = nil) {
        if let registerdUser = realm.objects(UserInfo.self).filter("eMail == %@", email ?? "").first {
            print("user's already registerd!")
            currentUser = registerdUser
        } else {
            let userInfo = UserInfo(firstName: userName, eMail: email ?? "")
            currentUser = userInfo
            saveUser(userInfo)
            print("new user saved!")
        }
        
        currentUser?.podcasts.forEach({ print(" podcast.id \($0.id)") })
    }
    
    func getCurrentUser() -> UserInfo? {
        realm.objects(UserInfo.self).first
    }
    
    func updateUserInfo(firstName: String, lastName: String, dateOfBirth: Date, gender: GenderType, image: Data?) {
        
        try! realm.write {
            if currentUser?.eMail == getCurrentUser()?.eMail {
                currentUser?.firstName = firstName
                currentUser?.lastName = lastName
                currentUser?.dateOfBithday = dateOfBirth
                currentUser?.gender = gender
                currentUser?.image = image
            } else {
                let newUser = UserInfo()
                newUser.firstName = firstName
                newUser.lastName = lastName
                newUser.dateOfBithday = dateOfBirth
                newUser.gender = gender
                newUser.image = image
                realm.add(newUser)
            }
        }
    }
    
    // MARK: - Methods for podcasts
    
    func save(podcast: PodcastModel) {
        try! realm.write {
            currentUser?.podcasts.append(podcast)
        }
        
        currentUser?.podcasts.forEach({ print(" podcast.id \($0.id)") })
        
    }
    
    func delete(podcast: PodcastModel) {
        try! realm.write {
            
            print("searched id: \(podcast.id)")
            
            currentUser?.podcasts.forEach({ print(" podcast.id \($0.id)") })

            
            if let index = currentUser?.podcasts.firstIndex(where: { $0.id == podcast.id }) {
                print("index: \(index)")
                currentUser?.podcasts.remove(at: index)
            } else {
                print("don't find index")
            }
        }
    }
    
//    func delete(for idPodcast: Int?) {
//        try! realm.write {
//            if let index = currentUser?.podcasts.firstIndex(where: { $0.id }) {
//                print("index: \(index)")
//                currentUser?.podcasts.remove(at: index)
//            }
//        }
//    }
    
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


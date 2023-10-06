//
//  UserModel.swift
//  PodcastApp
//
//  Created by  Dmitry on 06.10.2023.
//

import Foundation

enum Gender: String {
    case Male, Female
}

struct UserModel {
    var firstName: String?
    var lastName: String?
    var eMail: String?
    var dateOfBithday: Date?
    var gender: Gender?
    var image: Data?
}

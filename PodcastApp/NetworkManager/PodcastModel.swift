//
//  PodcastModel.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 29.09.2023.
//

import Foundation

struct SearchedResult: Codable {
    let status: String?
    let count: Int?
    let feeds: [Podcast]?
    let description: String?
}

struct Podcast: Codable {
    // categories
    let name: String?
    
    // podcasts
    let id: Int?
    let title: String?
    let description: String?
    let author: String?
    let image: String?
    let artwork: String?

    // trending
    let url: String?
    let itunesId: Int?
    let trendScore: Int?
    let language: String?
    
    let categories: [String: String]?
    
    var categoryNames: [String] {
        guard let dict = categories else { return [] }
        return dict.map { $0.value }
    }
    
    var categoriesLabel: String {
        guard let dict = categories else { return "" }
        let categories = dict.map { $0.value }
        return categories.joined(separator: " & ")
    }
   
}

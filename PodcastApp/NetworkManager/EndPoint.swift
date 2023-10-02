//
//  EndPoint.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 29.09.2023.
//

import Foundation

enum EndPoint {
    case getCategoryList
    case getTrendingPodcast
    case searchPodcasts
    
    var path: String {
        switch self {
        case .getCategoryList:
            return "/api/1.0/categories/list"
        case .getTrendingPodcast:
            return "/api/1.0/podcasts/trending"
        case .searchPodcasts:
            return "/api/1.0/search/byterm"
        }
    }
}

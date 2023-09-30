//
//  EndPoint.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 29.09.2023.
//

import Foundation

enum EndPoint {
    case getTrendingPodcast
    
    var path: String {
        switch self {
        case .getTrendingPodcast:
            return "/api/1.0/podcasts/trending"
        }
    }
}

//
//  Category.swift
//  PodcastApp
//
//  Created by Aleksandr Rybachev on 01.10.2023.
//

import Foundation

struct CategoryList {
    
    static func getFirstCategoryList() -> [String] {
        ["History", "Health", "Fitness", "Alternative", "Medicine",
         "Mental", "Nutrition", "Sexuality", "Kids", "Family",
         "Parenting", "Pets", "Animals", "Stories", "Leisure",
         "Animation", "Manga", "Automotive", "Aviation", "Crafts"]
    }
    
    static func getSecondCategoryList() -> [String] {
        ["🔥 Popular", "Arts", "Books", "Design", "Fashion", "Beauty",
         "Food", "Performing", "Visual", "Business", "Careers",
         "Entrepreneurship", "Investing", "Management", "Marketing", "Non-Profit",
         "Comedy", "Interviews", "Improv", "Stand-Up", "Education"]
    }
}

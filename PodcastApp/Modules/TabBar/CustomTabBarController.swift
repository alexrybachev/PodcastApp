//
//  CustomTabBarController.swift
//  PodcastApp
//
//  Created by Дмитрий Лоренц on 26.09.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
       
    }
    
    private func setControllers() {
        let homeVC = HomeViewController()
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        homeVC.tabBarItem = homeItem
        
        let searchVC = SearchViewController()
        let searchItem = UITabBarItem(title: nil, image: UIImage(named: "Search"), tag: 1)
        searchVC.tabBarItem = searchItem
        
        let favoritesVC = FavoritesViewController()
        let favoritesItem = UITabBarItem(title: nil, image: UIImage(named: "Bookmark"), tag: 2)
        favoritesVC.tabBarItem = favoritesItem
        
        let settingsVC = ProfileSettingsViewController()
        let settingsItem = UITabBarItem(title: nil, image: UIImage(named: "Setting"), tag: 3)
        settingsVC.tabBarItem = settingsItem
        
        viewControllers = [
        homeVC,
        searchVC,
        favoritesVC,
        settingsVC
        ]
    }

}

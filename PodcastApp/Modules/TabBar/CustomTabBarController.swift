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
        setAppearance()
    }
    
    private func setControllers() {
        let homeVC = HomeViewController()
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        homeItem.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: -30)
        homeVC.tabBarItem = homeItem
        
        let searchVC = SearchViewController()
        let searchItem = UITabBarItem(title: nil, image: UIImage(named: "Search"), tag: 1)
        searchItem.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        searchVC.tabBarItem = searchItem
        
        let favoritesVC = FavoritesViewController()
        let favoritesItem = UITabBarItem(title: nil, image: UIImage(named: "Bookmark"), tag: 2)
        favoritesItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        favoritesVC.tabBarItem = favoritesItem
        
        let settingsVC = ProfileSettingsViewController()
        let settingsItem = UITabBarItem(title: nil, image: UIImage(named: "Setting"), tag: 3)
        settingsItem.imageInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 30)
        settingsVC.tabBarItem = settingsItem
        
        viewControllers = [
        homeVC,
        searchVC,
        favoritesVC,
        settingsVC
        ]
    }
    
    private func setAppearance() {
        view.backgroundColor = .systemBackground
        //tabBar.backgroundColor = .systemGray6
        let positionOnX: CGFloat = 24
        let positionOnY: CGFloat = 12
        let width = tabBar.bounds.width - positionOnX * 2
        let height: CGFloat = tabBar.bounds.height + positionOnY * 2
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(
            roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY * 1.5 , width: width, height: height),
                                cornerRadius: 20)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemGray6.cgColor
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
        tabBar.itemPositioning = .fill
        
    }

}

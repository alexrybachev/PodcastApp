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
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let homeItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), selectedImage: UIImage(named: "HomeActive"))
        homeItem.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: -30)
        homeVC.tabBarItem = homeItem
        
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let searchItem = UITabBarItem(title: nil, image: UIImage(named: "Search"), selectedImage: UIImage(named: "SearchActive"))
        searchItem.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        searchVC.tabBarItem = searchItem
        
        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        let favoritesItem = UITabBarItem(title: nil, image: UIImage(named: "Bookmark"), selectedImage: UIImage(named: "BookmarkActive"))
        favoritesItem.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        favoritesVC.tabBarItem = favoritesItem
        
        let settingsVC = UINavigationController(rootViewController: ProfileSettingsViewController())
        let settingsItem = UITabBarItem(title: nil, image: UIImage(named: "Setting"), selectedImage: UIImage(named: "SettingActive"))
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
        let cornerRadius: CGFloat = 20
        let positionOnX: CGFloat = 24
        let positionOnY: CGFloat = 12
        let width = tabBar.bounds.width - positionOnX * 2
        let height: CGFloat = tabBar.bounds.height + positionOnY * 2
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(
            roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY * 1.5 , width: width, height: height),
                                cornerRadius: cornerRadius)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemBackground.cgColor
        //add shadow
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowRadius = cornerRadius
        shapeLayer.shadowOpacity = 0.15
        shapeLayer.shadowOffset = CGSize(width: positionOnY, height: positionOnY)
        shapeLayer.shadowPath = path.cgPath
        //add custom layer
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
        tabBar.itemPositioning = .fill
        
    }

}

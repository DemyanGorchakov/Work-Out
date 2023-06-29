//
//  MainTabBarController.swift
//  Work out
//
//  Created by Демьян Горчаков on 29.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setupItems()
    }
    
    private func setTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let profileVC = ProfileViewController()
        
        setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        guard let item = tabBar.items else { return }
        item[0].title = "Main"
        item[1].title = "Statistic"
        item[2].title = "Profile"
        
        item[0].image = UIImage(named: "tabBarMain")
        item[1].image = UIImage(named: "tabBarStatic")
        item[2].image = UIImage(named: "tabBarProfile")
    }
}

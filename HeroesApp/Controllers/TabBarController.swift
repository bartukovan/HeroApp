//
//  TabBarController.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        createControllers()
        configureTabbar()
        navigationController?.navigationBar.isHidden = true
    }
    
    func createControllers() {
        let firstVC = CharactersVC()
        let secondVC = FavouritesVC()
        
        let firstTabBarItem = UITabBarItem(title: "Karakterler", image: nil, selectedImage: nil)
        let secondTabBarItem = UITabBarItem(title: "Favoriler", image: nil, selectedImage: nil)
        
        firstVC.tabBarItem = firstTabBarItem
        secondVC.tabBarItem = secondTabBarItem
        
        let tabBarController = [firstVC, secondVC]
        viewControllers = tabBarController
    }
    
    func configureTabbar() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = .white
    }
}

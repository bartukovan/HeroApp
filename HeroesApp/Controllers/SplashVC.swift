//
//  SplashVC.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import UIKit

class SplashVC: UIViewController {
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigate()
    }
    
    func navigate() {
        let tabBarVC = TabBarController()
        navigationController?.pushViewController(tabBarVC, animated: false)
    }
}

//
//  MainTabBarController.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 7.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    let homeVC = HomeViewController()
    let categoriesVC = CategoriesViewController() // TODO: later change this to categories

    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers

    func configureViewControllers() {
        homeVC.title = "Home"
        let nav1 = templateNavigationController(image: UIImage(systemName: "house")!, rootController: homeVC)
        nav1.tabBarItem.title = "Home"
        
        categoriesVC.title = "Categories"
        let nav2 = templateNavigationController(image: UIImage(systemName: "square.grid.2x2")!, rootController: categoriesVC)
        nav2.tabBarItem.title = "Categories"
        
        viewControllers = [nav1, nav2]
    }
    
    func templateNavigationController(image: UIImage, rootController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
}

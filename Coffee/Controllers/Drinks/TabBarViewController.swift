//
//  MainViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
        
        // Do any additional setup after loading the view.
        
        let mainVC = DrinksViewController()//DrinksTableViewController()
        let navDrinksController = UINavigationController(rootViewController: mainVC)
        navDrinksController.navigationBar.barTintColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
        navDrinksController.navigationBar.backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)


        navDrinksController.navigationBar.prefersLargeTitles = true
        navDrinksController.navigationBar.isTranslucent = false
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let leftVC = ViewController()
        leftVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let rightVC = RightViewController()
        rightVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
              
        let tabBarList = [navDrinksController, leftVC, rightVC]
        viewControllers = tabBarList
        tabBar.backgroundColor = .clear
        
    }
}

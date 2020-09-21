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
        
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
        let mainVC = ViewController()
        
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let leftVC = LeftViewController()
        
        leftVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let rightVC = SalesViewController()
        let navSalesController = UINavigationController()
        navSalesController.navigationBar.barTintColor = UIColor.textColor
        navSalesController.navigationBar.backgroundColor = UIColor.navigationColor
        let attrs = [ NSAttributedString.Key.foregroundColor: UIColor.textColor ]
        navSalesController.navigationBar.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
        
        navSalesController.navigationBar.prefersLargeTitles = true
        navSalesController.navigationBar.isTranslucent = false
        navSalesController.pushViewController(rightVC, animated: true)
        rightVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
        
        let tabBarList = [mainVC, leftVC, navSalesController]
        
        viewControllers = tabBarList
        
        tabBar.backgroundColor = .clear
        
    }
}

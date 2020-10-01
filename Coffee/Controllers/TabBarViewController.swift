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
        
        view.backgroundColor = .globalMarromColor

        let mainVC = DrinksViewController()
        let navDrinksController = UINavigationController(rootViewController: mainVC)
        navDrinksController.navigationBar.barTintColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
        navDrinksController.navigationBar.backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)

        navDrinksController.navigationBar.prefersLargeTitles = true
        navDrinksController.navigationBar.isTranslucent = false
        mainVC.tabBarItem = UITabBarItem(title: "Cafés", image: UIImage(named: "xicaraCafe"), tag: 0)
        
        let grainsVC = GrainsCollectionViewController()
        let  navigationGrainsController = UINavigationController(rootViewController: grainsVC)
        navigationGrainsController.navigationBar.prefersLargeTitles = true
        grainsVC.tabBarItem = UITabBarItem(title: "Grãos", image: UIImage(named: "graosCafe"), tag: 1)
        
        let rightVC = SalesViewController()
        let navSalesController = UINavigationController()
        // mudando a status bar color
        navSalesController.navigationBar.barStyle  = .black
        navSalesController.navigationBar.barTintColor = UIColor.whiteColorCustomized
        navSalesController.navigationBar.backgroundColor = UIColor.globalMarromColor
        let attrs = [ NSAttributedString.Key.foregroundColor: UIColor.whiteColorCustomized ]
        navSalesController.navigationBar.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
        
        navSalesController.navigationBar.prefersLargeTitles = true
        navSalesController.navigationBar.isTranslucent = false
        navSalesController.pushViewController(rightVC, animated: true)
        rightVC.tabBarItem = UITabBarItem(title: "Locais de Venda", image: UIImage(named: "sacolaCafe"), tag: 2)
        
        let tabBarList = [navDrinksController, navigationGrainsController, navSalesController]
        
        viewControllers = tabBarList
        
        tabBar.backgroundColor = .globalMarromColor
        tabBar.tintColor = .amareloEscuroCustomized
    }
}

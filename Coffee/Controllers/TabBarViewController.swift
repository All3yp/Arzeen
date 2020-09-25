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
        
        mainVC.tabBarItem = UITabBarItem(title: "Cafés", image: UIImage(named: "xicaraCafe"), tag: 0)
        
        let leftVC = GrainsViewController()
        
        leftVC.tabBarItem = UITabBarItem(title: "Grãos", image: UIImage(named: "graosCafe"), tag: 1)
        
        let rightVC = SalesViewController()
        let navSalesController = UINavigationController()
        navSalesController.navigationBar.barTintColor = UIColor.textColor
        navSalesController.navigationBar.backgroundColor = UIColor.navigationColor
        let attrs = [ NSAttributedString.Key.foregroundColor: UIColor.textColor ]
        navSalesController.navigationBar.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
        
        navSalesController.navigationBar.prefersLargeTitles = true
        navSalesController.navigationBar.isTranslucent = false
        navSalesController.pushViewController(rightVC, animated: true)
        rightVC.tabBarItem = UITabBarItem(title: "Locais de Venda", image: UIImage(named: "sacolaCafe"), tag: 2)
        
        let tabBarList = [mainVC, leftVC, navSalesController]
        
        viewControllers = tabBarList
        
        tabBar.backgroundColor = .clear
        
    }
}

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
        
        view.backgroundColor = UIColor.globalMarromColor
        //Pq não fica da mesma cor da nav bar?
        
        // Do any additional setup after loading the view.
        
        let mainVC = ViewController()
        
        mainVC.tabBarItem = UITabBarItem(title: "Cafés", image: UIImage(named: "xicaraCafe"), tag: 0)
        
        let leftVC = LeftViewController()
        
        leftVC.tabBarItem = UITabBarItem(title: "Grãos", image: UIImage(named: "graosCafe"), tag: 1)
        
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
        
        let tabBarList = [mainVC, leftVC, navSalesController]
        
        viewControllers = tabBarList
        
        tabBar.backgroundColor = .clear
        tabBar.barTintColor = UIColor.globalMarromColor
        tabBar.tintColor = UIColor.amareloEscuroCustomized
        
    }
}

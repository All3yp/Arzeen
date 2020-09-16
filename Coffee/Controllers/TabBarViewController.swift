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
        
              let rightVC = RightViewController()
        
        rightVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
              
             let tabBarList = [mainVC, leftVC, rightVC]
        
        viewControllers = tabBarList
        
        tabBar.backgroundColor = .clear
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

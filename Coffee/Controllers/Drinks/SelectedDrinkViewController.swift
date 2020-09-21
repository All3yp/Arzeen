//
//  SelectedDrinkViewController.swift
//  Coffee
//
//  Created by Anderson Alencar on 21/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SelectedDrinkViewController: UIViewController {

    
    lazy var selectedDrink: UIView = {
        let selectedDrink = SelectedDrinkView()
        return selectedDrink
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = selectedDrink
        setNavigation()
        
    }
    
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor(red: 0.98, green: 0.62, blue: 0.09, alpha: 1.00)
    }
}

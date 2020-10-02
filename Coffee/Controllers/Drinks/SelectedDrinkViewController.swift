//
//  SelectedDrinkViewController.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

import UIKit

class SelectedDrinkViewController: UIViewController {
    
    var drink: Drink?
    
    lazy var selectedDrink: UIView = {
        let selectedDrink = SelectedDrinkView()
        selectedDrink.drink = drink
        selectedDrink.delegateDrink = self
        return selectedDrink
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = selectedDrink
        setNavigation()
        
    }
    
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor(red: 0.98, green: 0.62, blue: 0.09, alpha: 1.00)
    }
}

extension SelectedDrinkViewController: DrinksDelegate {
    func presentConfigDrink() {
        let configDrinkController = ConfigDrinkViewController()
        configDrinkController.drink = drink
        navigationController?.pushViewController(configDrinkController, animated: true)
    }
}

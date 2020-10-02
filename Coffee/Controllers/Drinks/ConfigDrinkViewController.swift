//
//  ConfigDrinkViewController.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ConfigDrinkViewController: UIViewController, TimerController {
    
    func timer() {
        let timer = TimeTaskViewController()
        timer.drink = drink
        navigationController?.pushViewController(timer, animated: true)
    }
    
    lazy var configDrinkView: ConfigDrinkView = {
        let configDrinkView = ConfigDrinkView()
        configDrinkView.drink = drink
        configDrinkView.timerDelegate = self
        configDrinkView.configDelegate = self
        return configDrinkView
    }()
    
    var drink: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = configDrinkView
    }
}

extension ConfigDrinkViewController: ConfigDrinkDelegate {
    func presentMethodDrink() {
        let methodController = MethodViewController()
        let navigation = UINavigationController(rootViewController: methodController)
        present(navigation, animated: true, completion: nil)
    }
}

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
        navigationController?.pushViewController(timer, animated: true)
    }
    
    lazy var configDrinkView: ConfigDrinkView = {
        let configDrinkView = ConfigDrinkView()
        configDrinkView.timerDelegate = self
        return configDrinkView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = configDrinkView
    }
}

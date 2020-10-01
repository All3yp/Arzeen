//
//  ConfigDrinkViewController.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ConfigDrinkViewController: UIViewController {

    lazy var configDrinkView: ConfigDrinkView = {
        let configDrinkView = ConfigDrinkView()
        return configDrinkView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = configDrinkView
    }
}

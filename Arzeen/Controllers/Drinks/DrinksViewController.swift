//
//  DrinksViewController.swift
//  Arzeen
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

import UIKit

class DrinksViewController: UIViewController {

    lazy var drinksView: DrinksView = {
        let drinksView = DrinksView()
        drinksView.delegateDrink = self
        return drinksView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = drinksView
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)]
        navigationItem.title = "Cafés"
        navigationItem.largeTitleDisplayMode = .always
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}

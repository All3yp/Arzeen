//
//  DrinksViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {

    lazy var drinksView: DrinksView = {
        let drinksView = DrinksView()
        drinksView.delegateDrink = self
        return drinksView
    }()
    
//    lazy var acessoryView: UIView = {
//        let acessoryView = UIView()
//        acessoryView.backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
//        acessoryView.translatesAutoresizingMaskIntoConstraints = false
//        return acessoryView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = drinksView
        //setUp()
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)]
        navigationItem.title = "Cafés"
        navigationItem.largeTitleDisplayMode = .always
    }
    
}

//extension DrinksViewController: ViewCode {
//    func buildHierarchy() {
//        //view.addSubview(acessoryView)
//        view.addSubview(drinksView)
//    }
//
//    func setUpLayoutConstraints() {
//        NSLayoutConstraint.activate([
//            acessoryView.topAnchor.constraint(equalTo: view.topAnchor),
//            acessoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            acessoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            acessoryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0001)
//        ])
//        NSLayoutConstraint.activate([
//            drinksView.topAnchor.constraint(equalTo: view.topAnchor),
//            drinksView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            drinksView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            drinksView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    func aditionalConfigurations() {
//        view.backgroundColor = .black
//    }
//}

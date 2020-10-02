//
//  MethodViewController.swift
//  Arzeen
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class MethodViewController: UIViewController {

    lazy var methodView: MethodView = {
        let methodView = MethodView()
        return methodView
    }()
    
    var titleMethod: String? = "Chemex"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = methodView
        configureBackButton()
        navigationItem.title = titleMethod
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.amareloEscuroCustomized!]
    }
    
    func configureBackButton() {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back2"), for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 50, height: 51)
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}

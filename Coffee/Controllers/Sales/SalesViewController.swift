//
//  RightViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SalesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Locais de Venda"
        setupUI()
        
        if let path = Bundle.main.path(forResource: "DataModel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let dataModel = try JSONDecoder().decode(ListOfResults.self, from: data)
                print(dataModel)
            } catch {
                print("Failed to read json data")
            }
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(tableView)
        tableView.rowHeight = 139
        tableView.tableAutoLayout(to: view)
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    @objc private func pressedStoreButton(sender: UIButton) {
        let destination = SelectedStoreViewController()
        present(destination, animated: true)
    }
    
}

extension SalesViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
    // Setando o tamanho da table
}

extension SalesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? SalesTableViewCell else {
            return SalesTableViewCell()
        }
        
        cell.storeButton.addTarget(self, action: #selector(pressedStoreButton), for: .touchUpInside)
        //        cell.storeButton.tag = section
        cell.store2Button.addTarget(self, action: #selector(pressedStoreButton), for: .touchUpInside)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Set code for a selected row
    }
    
}

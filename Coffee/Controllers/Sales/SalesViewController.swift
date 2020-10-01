//
//  RightViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SalesViewController: UIViewController {
    
    let modelStore = ModelRepository().readAll()
    let destination = SelectedStoreViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Locais de Venda"
        setupUI()
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
        tableView.backgroundColor = UIColor.blackColorCustomized
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    //    @objc private func pressedStoreButton(sender: UIButton) {
    //        present(destination, animated: true)
    //    }
    
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
        
        return modelStore.listOfStores.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? SalesTableViewCell else {
            return SalesTableViewCell()
        }
        
        //        destination.storeSelectedData = modelStore.listOfStores[indexPath.row]
        //Mandando os dados da loja selecionada pra selectedStore
        
        cell.selectedButton = self
        
        cell.index = indexPath.row
        
        cell.grainNameLabel.text = modelStore.listOfStores[indexPath.row].grain?.nameOfCoffee
        cell.typeOfGrainLabel.text = modelStore.listOfStores[indexPath.row].grain?.varietyOfGrain
        cell.storeButton.setTitle(modelStore.listOfStores[indexPath.row].name, for: .normal)
        cell.firstStoreImageView.image = UIImage(named: modelStore.listOfStores[indexPath.row].imageStore!)
        //Consumindo o model nos elementos da tela
        
        cell.selectionStyle = .none
        return cell
    }
    
}

extension SalesViewController: StoreButtonSelected {
    func nextScreen(index: Int) {
        destination.indexRow = index
        destination.storeSelectedData = modelStore.listOfStores[index]
        
        present(destination, animated: true)
        
    }
    
}

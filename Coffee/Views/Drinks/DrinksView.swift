//
//  DrinksView.swift
//  Coffee
//
//  Created by Anderson Alencar on 17/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class DrinksView: UIView {
    
    weak var delegateDrink: DrinksViewController?

    lazy var drinksTable: UITableView = {
        let drinksTable = UITableView()
        drinksTable.separatorStyle = .none
        drinksTable.showsVerticalScrollIndicator = false
        drinksTable.bounces = false
        drinksTable.register(DrinkTableViewCell.self, forCellReuseIdentifier: "DrinkCell")
        drinksTable.delegate = self
        drinksTable.dataSource = self
        drinksTable.translatesAutoresizingMaskIntoConstraints = false
        return drinksTable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DrinksView: ViewCode {
    func buildHierarchy() {
        addSubview(drinksTable)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            drinksTable.topAnchor.constraint(equalTo: topAnchor),
            drinksTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            drinksTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            drinksTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .white
    }
}

extension DrinksView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as! DrinkTableViewCell
        cell.prepareCell(drinkImage: UIImage(named: "chemex")!, drinkName: "Macchiato", typeCoffee: "Serrado Mineiro", intensity: "Fraco", time: "5 min")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 3.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDrink = SelectedDrinkViewController()
        delegateDrink?.navigationController?.pushViewController(selectedDrink, animated: true)
    }
}

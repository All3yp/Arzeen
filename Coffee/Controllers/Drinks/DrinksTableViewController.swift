//
//  DrinksTableViewController.swift
//  Coffee
//
//  Created by Anderson Alencar on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class DrinksTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DrinkTableViewCell.self, forCellReuseIdentifier: "DrinkCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as! DrinkTableViewCell
        cell.prepareCell(drinkImage: UIImage(named: "chemex")!, drinkName: "Macchiato", typeCoffee: "Serrado Mineiro", intensity: "Fraco", time: "5 min")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 3.5
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
      return "Students"
    }
}

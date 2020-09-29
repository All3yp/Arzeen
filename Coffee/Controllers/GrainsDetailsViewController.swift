//
//  LeftViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class GrainsDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // setup
        setupGrainsUI()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
   /*
    lazy var tableViewWithoutButton: UITableView = {
        let tableViewWithoutButton = UITableView()
        tableViewWithoutButton.delegate = self
        tableViewWithoutButton.dataSource = self
        tableViewWithoutButton.register(GrainsTableViewCellWithoutButton.self, forCellReuseIdentifier: "TVWithoutButton")
        view.addSubview(tableViewWithoutButton)
        tableViewWithoutButton.rowHeight = 250
        tableViewWithoutButton.tableAutoLayout(to: view)
        tableViewWithoutButton.separatorStyle = .singleLine
        return tableViewWithoutButton
    }()
    */
    
    lazy var tableViewWithButton: UITableView = {
        let tableViewWithButton = UITableView()
        tableViewWithButton.delegate = self
        tableViewWithButton.dataSource = self
        tableViewWithButton.register(GrainsTableViewCellWithButton.self, forCellReuseIdentifier: "TVWithButton")
        view.addSubview(tableViewWithButton)
        tableViewWithButton.rowHeight = 125
        tableViewWithButton.tableAutoLayout(to: view)
        tableViewWithButton.separatorStyle = .singleLine
        return tableViewWithButton
    }()
    // setar a tableView
    // Ver o uso do Header (Talk do Yuri)
    //
    
    // adicionar imagem na NavBar?
    // Criar Celulas personalizadas
        // Usar Lazy Var para setar as celulas personalizadas
        /* Lembrar que ao construir cada componente seja uma label, será uma lazy var para cada componente, FRAGMENTE-OS, não permita deixar
            com 
        */
    // 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GrainsDetailsViewController {
    private func setupGrainsUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
//
//        NSLayoutConstraint.activate([
//            tableViewWithoutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            tableViewWithoutButton.heightAnchor.constraint(equalTo: self.view.heightAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            tableViewWithButton.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableViewWithButton.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
    // Setando o tamanho da table
}


extension GrainsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithButton", for: indexPath) as! GrainsTableViewCellWithButton
        return cell
//        switch tableView {
//        case self.tableViewWithButton:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithButton", for: indexPath) as! GrainsTableViewCellWithButton
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithoutButton", for: indexPath) as! GrainsTableViewCellWithoutButton
//            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Por o código quando a celula for selecionada
    }
    
}

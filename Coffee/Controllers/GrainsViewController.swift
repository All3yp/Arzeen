//
//  LeftViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 16/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class GrainsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // setup
        setupGrainsUI()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GrainsTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(tableView)
        tableView.rowHeight = 120
        tableView.tableAutoLayout(to: view)
        tableView.separatorStyle = .none
        return tableView
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

extension GrainsViewController {
    private func setupGrainsUI() {
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


extension GrainsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? GrainsTableViewCell else {
            return GrainsTableViewCell() // Retornar a lista de celulas de Grãos a partir da TableView
        }
                
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Por o código quando a celula for selecionada
    }
    
}

//
//  SpecieGrainsDetailsViewController.swift
//  Coffee
//
//  Created by Cristiano Coutinho on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SpecieGrainsDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // setup
        setupGrainsUI()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Especie de grãos para o Botão
    var specieGrains: [String] = ["Arábica", "Robusta"];
    
    // Título para os detalhes dos grãos
    var titleForLabel: [String] = ["Origem", "Cultivo", "Sabor"]
    
    // Descrição para os detalhes de cada titulo para grãos, Exemplo Catuaí
    var describeForGrainsDetails = ["A planta que dá origem a esta variedade do grão é proveniente das montanhas da Etiópia.",
    "A altitude está amplamente relacionada à qualidade do grão produzido, ou seja, quanto mais alta for a altitude da lavoura, maior será a qualidade do grão.",
    "Possui, em média, 50% menos cafeína, mas possui um teor maior de açúcares, responsáveis pela complexidade de sabores dessa variedade."]
    
    
    
    lazy var specieGrainsDetailsTV: UITableView = {
        let specieGrainsDetailsTableView = UITableView()
        specieGrainsDetailsTableView.delegate = self
        specieGrainsDetailsTableView.dataSource = self
        specieGrainsDetailsTableView.register(GrainsTableViewCellWithoutButton.self, forCellReuseIdentifier: "TVWithoutButton")
        specieGrainsDetailsTableView.register(GrainsTableViewCellWithButton.self, forCellReuseIdentifier: "TVWithButton")
        view.addSubview(specieGrainsDetailsTableView)
        //tableViewWithoutButton.rowHeight = 150
        specieGrainsDetailsTableView.tableAutoLayout(to: view)
        specieGrainsDetailsTableView.separatorStyle = .none
        return specieGrainsDetailsTableView
    }()
}

extension SpecieGrainsDetailsViewController {
    private func setupGrainsUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        NSLayoutConstraint.activate([
            specieGrainsDetailsTV.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            specieGrainsDetailsTV.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
}


extension SpecieGrainsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithoutButton", for: indexPath) as! GrainsTableViewCellWithoutButton
        cell.titleLabel.text = titleForLabel[indexPath.row]
        cell.describeGrainLabel.text = describeForGrainsDetails[indexPath.row]
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return tableView.frame.size.height/5
        
    }
    
}

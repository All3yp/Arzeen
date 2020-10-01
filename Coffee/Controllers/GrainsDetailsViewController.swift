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
       // setup a cor do do titulo do Grão
        setupGrainsUI()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Especie de grãos para o Botão
    var specieGrains: [String] = ["Arábica", "Robusta"];
    
    // Título para os detalhes dos grãos
    var titleForLabel: [String] = ["Espécie", "Origem", "Cultivo", "Sabor"]
    
    // Descrição para os detalhes de cada titulo para grãos, Exemplo Catuaí
    var describeForGrainsDetails = [" ", "Espécie derivada do Arábica amplamente cultivada no Brasil, especialmente na região de Poços, em Minas Gerais.",
    "Para consiguir extrair todo o potencial dessa variedade, é indispensável que seja cultivado em altitudes acima de 900 m!",
    "Além de sua acidez moderada e o sabor dispensa o uso de açúcar, ele é um café leve e suave, de aroma adocicado com notas florais."]
    
   
    
    lazy var tableViewWithoutButton: UITableView = {
        let tableViewWithoutButton = UITableView()
        tableViewWithoutButton.delegate = self
        tableViewWithoutButton.dataSource = self
        tableViewWithoutButton.register(GrainsTableViewCellWithoutButton.self, forCellReuseIdentifier: "TVWithoutButton")
        tableViewWithoutButton.register(GrainsTableViewCellWithButton.self, forCellReuseIdentifier: "TVWithButton")
        view.addSubview(tableViewWithoutButton)
        //tableViewWithoutButton.rowHeight = 150
        tableViewWithoutButton.tableAutoLayout(to: view)
        tableViewWithoutButton.separatorStyle = .none
        return tableViewWithoutButton
    }()
    
    // Função que avisa para a View que será apresentado uma nova tela
    @objc func navigateNextScreen(sender: UIButton){
        //instanciar o left back button item na navigation Bar
        let specieController = SpecieGrainsDetailsViewController()
        let navigationController = UINavigationController(rootViewController: specieController)// Setar navigation
        present(navigationController, animated: true) //Substituir a modal para o fluxo de navegação
    }
    
//    lazy var tableViewWithButton: UITableView = {
//        let tableViewWithButton = UITableView()
//        tableViewWithButton.delegate = self
//        tableViewWithButton.dataSource = self
//        tableViewWithButton.register(GrainsTableViewCellWithButton.self, forCellReuseIdentifier: "TVWithButton")
//        view.addSubview(tableViewWithButton)
//        tableViewWithButton.rowHeight = 125
//        tableViewWithButton.tableAutoLayout(to: view)
//        tableViewWithButton.separatorStyle = .singleLine
//        return tableViewWithButton
//    }()
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
            tableViewWithoutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableViewWithoutButton.heightAnchor.constraint(equalTo: self.view.heightAnchor)
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithoutButton", for: indexPath) as! GrainsTableViewCellWithoutButton
//        return cell
//        switch tableView {
//        case self.tableViewWithButton:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithButton", for: indexPath) as! GrainsTableViewCellWithButton
//            return cell
//
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithButton", for: indexPath) as! GrainsTableViewCellWithButton
//            return cell
//        }
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithButton", for: indexPath) as! GrainsTableViewCellWithButton
            cell.cellButton.addTarget(self, action: #selector(navigateNextScreen(sender:)), for: .touchUpInside)
           // cell.selectionStyle = .none
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVWithoutButton", for: indexPath) as! GrainsTableViewCellWithoutButton
            cell.titleLabel.text = titleForLabel[indexPath.row]
            cell.describeGrainLabel.text = describeForGrainsDetails[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return tableView.frame.size.height/5.25
        }
        else{
            return tableView.frame.size.height/5
        }
    }
    
}

//
//  DrinkManager.swift
//  Coffee
//
//  Created by Anderson Alencar on 01/10/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class DrinkManager {
    
    static var shared: DrinkManager = {
        return DrinkManager()
    }()
    
    private init() {}
    
    func readData() -> [Drink] {
        var listDrink: [Drink]?
        if let path = Bundle.main.path(forResource: "DrinksDeteste", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let dataModel = try JSONDecoder().decode([Drink].self, from: data)
                listDrink = dataModel
            } catch {
                print("Failed to read json data")
            }
        }
        return listDrink!
    }
    
//    func saveJsonFile() {
//        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        var fileUrl = documentDirectoryUrl.appendingPathComponent("DrinksDeTeste")
//            fileUrl = fileUrl.appendingPathExtension("json")
//
//
//
//        let comb = Combination(photoFood: 1, nameFood: "Cuscuz")
//        let comb2 = Combination(photoFood: 2, nameFood: "Tapioca")
//        let comb3 = Combination(photoFood: 3, nameFood: "Bolo de Laranja")
//
//        let drink = Drink(photoDrink: 1, name: "Latte", description: "O Latte é uma combinação do café expresso com uma quantidade generosa de leite ou sua espuma no topo do copo. No Brasil, principalmente em padarias e bares, é conhecido como o famoso pingado",
//                          combinations: [comb, comb2, comb3], recommendedCoffee: "Kona", intensity: "Leve",
//                          preparationTime: [8,10],
//                          stepByStep: ["Caso tenha aeroccino coloque leite integral ou de amêndoas e inicie a preparação da espuma, se não tiver basta iniciar a fervura do leite checando a temperatura no dorço da mão","Aqueça 150 ml de água até o ponto em que esteja formando bolhas, mas que não esteja em ponto de ebulição","Adicione 2 colheres de sopa do café de sua preferência em seu filtro, não esqueça de usar um café do tipo seleção","Adicione a água ao filtro","Verta o leite quente para o copo da receita","adicione os 150 ml de café","Aprecie seu café"], mlPerCup: 200)
//
//            do {
//                let data = try JSONEncoder().encode(drink)
//                let string = String(data: data, encoding: .utf8)
//                print(string)
//                try data.write(to: fileUrl, options: [.atomicWrite])
//            } catch {
//                print(error)
//                print("Deu muito ruim")
//            }
//    }
}

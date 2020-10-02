//
//  DrinkModel.swift
//  Coffee
//
//  Created by Anderson Alencar on 01/10/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

struct Drink: Codable {
    var photoDrink: Int
    var name: String
    var description: String
    var combinations: [Combination]
    var recommendedCoffee: String
    var intensity: String
    var preparationTime: [Int]
    var stepByStep: [String]
    var mlPerCup: Int
}

struct Combination: Codable {
    var photoFood: Int
    var nameFood: String
}

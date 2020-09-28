//
//  Store.swift
//  Coffee
//
//  Created by Brena Amorim on 28/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

struct ListOfStores: Codable {
    let listOfStores: [DataStore]
}

struct DataStore: Codable {
    let name: String
    let location: String
    let latitude: Float
    let longitude: Float
    let grain: Grain
}

struct Grain: Codable {
    let name: String
    let species: String
    let origin: String
    //Origem mais resumida pra tela de vendas?
    let cultivation: String
    let flavor: String
    let varietyOfGrain: String
    let details: Details
}

struct Details: Codable {
    let sensoryProfile: String
    let altitude: String
    let body: Int
    let acidity: Int
}

//
//  Store.swift
//  Arzeen
//
//  Created by Brena Amorim on 28/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

struct ListOfResults: Codable {
    var listOfStores: [ListOfStore]
}

struct ListOfStore: Codable {
    var name: String?
    var imageStore: String?
    var location: String?
    var latitude: Double?
    var longitude: Double?
    var grain: Grain?
}

struct Grain: Codable {
    
    var imageName: String?
    var name: String?
    var nameOfCoffee: String?
    var state: String?
    var country: String?
    
    var finalization: Float
    var contrast: Float
    var torra: Float
    
    var species: String?
    var origin: String?
    var cultivation: String?
    var flavor: String?
    var varietyOfGrain: String?
    var originOfGrain: String?
    var details: Details?
    
}

struct Details: Codable {
    var sensoryProfile: String?
    var altitude: String?
    var body: Double?
    var acidity: Double?
}

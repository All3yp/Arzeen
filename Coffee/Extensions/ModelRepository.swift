//
//  FileHelper.swift
//  Coffee
//
//  Created by Brena Amorim on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

class ModelRepository: ModelProtocol {
        
    func readAll() -> ListOfResults {
        
        let results = readFile()!
        return results
        
    }
    
    func readFile() -> ListOfResults? {
        
        if let path = Bundle.main.path(forResource: "DataModel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let dataModel = try JSONDecoder().decode(ListOfResults.self, from: data)
                return dataModel
            } catch {
                print("Failed to read json data")
                return nil
            }
        }
        
        return nil
    }
        
}

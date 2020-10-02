//
//  OnBoard.swift
//  Arzeen
//
//  Created by Alley Pereira on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

// swiftlint:disable line_length
import Foundation

struct Onboards {
    var image: String
    var subtitle: String
    var buttonTitle: String
    
    static func mockOnboard() -> [Onboards] {
        return [
            Onboards(image: "page01Onboarding", subtitle: "Dê uma pausa no seu dia, tenha boas experiências no preparo do seu café, experimente os diferentes métodos de preparo e aprecie o resultado final", buttonTitle: "Next"),
            
            Onboards(image: "page02Onboarding", subtitle: "Conheça os grãos especiais e as experiências sensoriais que eles proporcionam com diferentes métodos de preparo", buttonTitle: "Start")
        ]
    }
}

//
//  ViewCode.swift
//  Arzeen
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation

protocol ViewCode {
    func buildHierarchy()
    func setUpLayoutConstraints()
    func aditionalConfigurations()
}

extension ViewCode {
    func setUp() {
        buildHierarchy()
        setUpLayoutConstraints()
        aditionalConfigurations()
    }
}

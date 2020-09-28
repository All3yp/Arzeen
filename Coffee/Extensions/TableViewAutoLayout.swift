//
//  tableAutoLayout.swift
//  Coffee
//
//  Created by Brena Amorim on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

extension UIView {

    public func tableAutoLayout(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

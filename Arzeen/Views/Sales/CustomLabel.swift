//
//  customLabel.swift
//  Arzeen
//
//  Created by Brena Amorim on 26/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String?, textColor: UIColor, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
    private func setupLabel() {
        numberOfLines = 1
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
// Classe criada pra reaproveitar Labels
// Mudanças em cor, texto e fonte setadas em convenience init

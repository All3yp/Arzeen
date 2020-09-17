//
//  SalesView.swift
//  Coffee
//
//  Created by Brena Amorim on 17/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SalesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let grainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .yellow
        return label
    }()
    
    func setupViews() {
        
    }
    
    func setupConstraints() {
        
    }
}

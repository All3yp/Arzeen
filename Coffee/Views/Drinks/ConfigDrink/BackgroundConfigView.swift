//
//  BackgroundConfigView.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class BackgroundConfigView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
}

//
//  MethodView.swift
//  Arzeen
//
//  Created by Anderson Alencar on 28/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class MethodView: UIView {

    lazy var methodImage: UIImageView = {
        let methodImage = UIImageView()
        methodImage.image = UIImage(named: "chemex")
        methodImage.contentMode = .scaleAspectFit
        methodImage.clipsToBounds = true
        methodImage.translatesAutoresizingMaskIntoConstraints = false
        return methodImage
    }()
    
    lazy var methodDescription: UILabel = {
        let methodDescription = UILabel()
        methodDescription.text = "TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes TEstes "
        methodDescription.numberOfLines = 0
        methodDescription.adjustsFontSizeToFitWidth = true
        methodDescription.minimumScaleFactor = 0.7
        methodDescription.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        methodDescription.textColor = .amareloClaroCustomized
        methodDescription.translatesAutoresizingMaskIntoConstraints = false
        return methodDescription
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setUp()
    }
    
}

extension MethodView: ViewCode {
    func buildHierarchy() {
        addSubview(methodImage)
        addSubview(methodDescription)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            methodImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            methodImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            methodImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            methodImage.heightAnchor.constraint(equalTo: methodImage.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            methodDescription.topAnchor.constraint(equalTo: methodImage.bottomAnchor, constant: 20),
            methodDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            methodDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .blackColorCustomized
    }
}

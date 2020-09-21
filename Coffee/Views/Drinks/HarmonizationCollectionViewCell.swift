//
//  HarmonizationCollectionViewCell.swift
//  Coffee
//
//  Created by Anderson Alencar on 21/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class HarmonizationCollectionViewCell: UICollectionViewCell {
    
    lazy var imageFood: UIImageView = {
        let imageFood = UIImageView()
        imageFood.clipsToBounds = true
        imageFood.contentMode = .scaleAspectFill
        imageFood.translatesAutoresizingMaskIntoConstraints = false
        return imageFood
    }()
    
    lazy var nameFood: UILabel = {
        let drinkName = UILabel()
        drinkName.numberOfLines = 0
        drinkName.textAlignment = .center
        drinkName.adjustsFontSizeToFitWidth = true
        drinkName.minimumScaleFactor = 0.7
        drinkName.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        drinkName.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        drinkName.translatesAutoresizingMaskIntoConstraints = false
        return drinkName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(imageFood: UIImage, nameFood: String) {
        self.imageFood.image = imageFood
        self.nameFood.text = nameFood
    }
    
    override func layoutSubviews() {
        setUp()
    }
}

extension HarmonizationCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(imageFood)
        addSubview(nameFood)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            imageFood.topAnchor.constraint(equalTo: topAnchor),
            imageFood.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageFood.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageFood.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
        NSLayoutConstraint.activate([
            nameFood.topAnchor.constraint(equalTo: imageFood.bottomAnchor, constant: 7),
            nameFood.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameFood.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
    }
}

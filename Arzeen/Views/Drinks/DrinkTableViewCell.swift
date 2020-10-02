//
//  DrinkTableViewCell.swift
//  Arzeen
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {

    lazy var drinkImage: UIImageView = {
        let drinkImage = UIImageView()
        drinkImage.clipsToBounds = true
        drinkImage.layer.cornerRadius = 12.0
        drinkImage.contentMode = .scaleAspectFill
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        return drinkImage
    }()
    
    lazy var drinkName: UILabel = {
        let drinkName = UILabel()
        drinkName.numberOfLines = 0
        drinkName.adjustsFontSizeToFitWidth = true
        drinkName.minimumScaleFactor = CGFloat(17)
        drinkName.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        drinkName.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        drinkName.translatesAutoresizingMaskIntoConstraints = false
        return drinkName
    }()
    
    lazy var recommendedCoffee: UILabel = {
        let recommendedCoffee = UILabel()
        recommendedCoffee.numberOfLines = 0
        recommendedCoffee.adjustsFontSizeToFitWidth = true
        recommendedCoffee.minimumScaleFactor = CGFloat(17)
        recommendedCoffee.font = UIFont.systemFont(ofSize: 17, weight: .light)
        recommendedCoffee.textColor = UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)
        recommendedCoffee.translatesAutoresizingMaskIntoConstraints = false
        return recommendedCoffee
    }()
    
    lazy var intensity: UILabel = {
        let intensity = UILabel()
        intensity.numberOfLines = 1
        intensity.adjustsFontSizeToFitWidth = true
        intensity.minimumScaleFactor = 0.7
        intensity.font = UIFont.systemFont(ofSize: 17, weight: .light)
        intensity.textColor = UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)
        intensity.translatesAutoresizingMaskIntoConstraints = false
        return intensity
    }()
    
    lazy var preparationTime: UILabel = {
        let preparationTime = UILabel()
        preparationTime.numberOfLines = 1
        preparationTime.adjustsFontSizeToFitWidth = true
        preparationTime.minimumScaleFactor = CGFloat(17)
        preparationTime.font = UIFont.systemFont(ofSize: 17, weight: .light)
        preparationTime.textColor = UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)
        preparationTime.translatesAutoresizingMaskIntoConstraints = false
        return preparationTime
    }()
    
    lazy var acessoryCustomView: UIView = {
        let acessoryCustomView = UIView()
        acessoryCustomView.backgroundColor = UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)
        acessoryCustomView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryCustomView
    }()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        setUp()
    }
    
    func prepareCell(drinkImage: UIImage, drinkName: String, typeCoffee: String, intensity: String, time: String) {
        self.drinkImage.image = drinkImage
        self.drinkName.text = drinkName
        self.recommendedCoffee.text = typeCoffee
        self.intensity.text = intensity
        self.preparationTime.text = time
    }

}

extension DrinkTableViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(drinkImage)
        addSubview(drinkName)
        addSubview(recommendedCoffee)
        addSubview(intensity)
        addSubview(preparationTime)
        addSubview(acessoryCustomView)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            //drinkImage.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            drinkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            drinkImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3.0),
            drinkImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            drinkImage.heightAnchor.constraint(equalTo: drinkImage.widthAnchor, multiplier: 1)
            //drinkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            drinkName.topAnchor.constraint(equalTo: drinkImage.topAnchor, constant: 20),
            drinkName.leadingAnchor.constraint(equalTo: drinkImage.trailingAnchor, constant: 12),
            drinkName.trailingAnchor.constraint(equalTo: trailingAnchor)
            //drinkName.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0.18)

        ])
        
        NSLayoutConstraint.activate([
            recommendedCoffee.topAnchor.constraint(equalTo: drinkName.bottomAnchor, constant: 15),
            recommendedCoffee.leadingAnchor.constraint(equalTo: drinkName.leadingAnchor),
            recommendedCoffee.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            intensity.topAnchor.constraint(equalTo: recommendedCoffee.bottomAnchor, constant: 15),
            intensity.leadingAnchor.constraint(equalTo: recommendedCoffee.leadingAnchor),
            intensity.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            preparationTime.topAnchor.constraint(equalTo: intensity.topAnchor),
            preparationTime.leadingAnchor.constraint(equalTo: intensity.trailingAnchor, constant: 10),
            preparationTime.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            acessoryCustomView.centerXAnchor.constraint(equalTo: centerXAnchor),
            acessoryCustomView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            acessoryCustomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.005),
            acessoryCustomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
    }
}

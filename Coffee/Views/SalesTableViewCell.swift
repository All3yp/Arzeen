//
//  SalesTableViewCell.swift
//  Coffee
//
//  Created by Brena Amorim on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SalesTableViewCell: UITableViewCell {
    
    // Inicialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupViews()
        setupConstraints()
        self.backgroundColor = UIColor.backgroundColor
    }
    
    let grainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 1
        label.text = "Bourbon"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //(name: ".SFProDisplay-Bold", size: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeOfGrainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.textColor
        label.numberOfLines = 1
        label.text = "Variedade de café Arábica"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let storeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        // ajusta pro texto caber no label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.text = "Amika Coffehouse"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let store2Label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.text = "Mercado do Café"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let partition: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.textColor
        return partition
    }()

    let firstStoreImageView: UIImageView = {
        let storeImage = UIImageView()
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.masksToBounds = false
        storeImage.layer.borderColor = UIColor.systemYellow.cgColor
        storeImage.layer.cornerRadius = 15
        storeImage.clipsToBounds = true
        return storeImage
    }()

    let secondStoreImageView: UIImageView = {
        let storeImage = UIImageView()
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.masksToBounds = false
        storeImage.layer.borderColor = UIColor.systemYellow.cgColor
        storeImage.layer.cornerRadius = 15
        storeImage.clipsToBounds = true
        return storeImage
    }()
    
    //    let thirdStoreImageView: UIImageView = {
    //        let storeImage = UIImageView()
    //        storeImage.layer.borderWidth = 1.0
    //        storeImage.layer.masksToBounds = false
    //        storeImage.layer.borderColor = UIColor.white.cgColor
    //        storeImage.layer.cornerRadius = storeImage.frame.size.width / 2
    //        storeImage.clipsToBounds = true
    //        return storeImage
    //    }()
    
}

// Set constraints
extension SalesTableViewCell {
    
    private func setupViews() {
        self.contentView.addSubview(grainLabel)
        self.contentView.addSubview(typeOfGrainLabel)
        self.contentView.addSubview(partition)
        self.contentView.addSubview(firstStoreImageView)
        self.contentView.addSubview(storeLabel)
        self.contentView.addSubview(secondStoreImageView)
        self.contentView.addSubview(store2Label)
        //        self.contentView.addSubview(thirdStoreImageView)
    }
    
    private func setupConstraints() {
        // Permitindo a definição de autoLayout viewCode
        grainLabel.translatesAutoresizingMaskIntoConstraints = false
        typeOfGrainLabel.translatesAutoresizingMaskIntoConstraints = false
        partition.translatesAutoresizingMaskIntoConstraints = false
        firstStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        secondStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        //        thirdStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setando as constraints
        NSLayoutConstraint.activate([
            grainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58.5),
            grainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            //            grainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50.5)
        ])
        
        NSLayoutConstraint.activate([
            typeOfGrainLabel.topAnchor.constraint(equalTo: grainLabel.bottomAnchor),
            typeOfGrainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            typeOfGrainLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 206)
        ])
        
        NSLayoutConstraint.activate([
            partition.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            partition.heightAnchor.constraint(equalToConstant: 115),
            partition.widthAnchor.constraint(equalToConstant: 1),
            partition.leadingAnchor.constraint(equalTo: typeOfGrainLabel.trailingAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            firstStoreImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 44),
            firstStoreImageView.leadingAnchor.constraint(equalTo: partition.trailingAnchor, constant: 8),
            firstStoreImageView.heightAnchor.constraint(equalToConstant: 30),
            firstStoreImageView.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            secondStoreImageView.topAnchor.constraint(equalTo: firstStoreImageView.bottomAnchor, constant: 16),
            secondStoreImageView.leadingAnchor.constraint(equalTo: partition.trailingAnchor, constant: 8),
            secondStoreImageView.heightAnchor.constraint(equalToConstant: 30),
            secondStoreImageView.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            storeLabel.centerYAnchor.constraint(equalTo: firstStoreImageView.centerYAnchor),
            storeLabel.leadingAnchor.constraint(equalTo: firstStoreImageView.trailingAnchor, constant: 8),
            storeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            store2Label.centerYAnchor.constraint(equalTo: secondStoreImageView.centerYAnchor),
            store2Label.leadingAnchor.constraint(equalTo: secondStoreImageView.trailingAnchor, constant: 8),
            store2Label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UIColor {

    static let backgroundColor = UIColor.init(hex: "#151012", alpha: 1.0)
    static let navigationColor = UIColor.init(hex: "#291E22", alpha: 1.0)
    static let actionColor = UIColor.init(hex: "#FA9D17", alpha: 1.0)
    static let titleColor = UIColor.init(hex: "#FFBD5D", alpha: 1.0)
    static let textColor = UIColor.init(hex: "#E8D7C2", alpha: 1.0)
    
    public convenience init?(hex: String, alpha: CGFloat) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
        return
    }
}

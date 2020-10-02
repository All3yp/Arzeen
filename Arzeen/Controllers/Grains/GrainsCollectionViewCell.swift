//
//  GrainsCollectionViewCell.swift
//  Arzeen
//
//  Created by Alley Pereira on 24/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit
//swiftlint:disable trailing_comma
class GrainsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.globalMarromColor
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var grainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.whiteColorCustomized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.whiteColorCustomized
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.font = UIFont.systemFont(ofSize: 15)
        cityLabel.textColor = UIColor.whiteColorCustomized
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityLabel
    }()
}

// MARK: - UI Setup
extension GrainsCollectionViewCell {
    private func setupUI() {
        
        self.backgroundColor = .clear
        
        self.contentView.addSubview(roundedBackgroundView)
        
        roundedBackgroundView.addSubview(imageView)
        roundedBackgroundView.addSubview(grainLabel)
        roundedBackgroundView.addSubview(countryLabel)
        roundedBackgroundView.addSubview(lineView)
        roundedBackgroundView.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            
            grainLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            grainLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5),
            grainLabel.heightAnchor.constraint(equalToConstant: 17),
            
            countryLabel.topAnchor.constraint(equalTo: self.grainLabel.bottomAnchor, constant: 2),
            countryLabel.centerXAnchor.constraint(equalTo: self.grainLabel.centerXAnchor),
            countryLabel.heightAnchor.constraint(equalToConstant: 15),
    
            imageView.centerXAnchor.constraint(equalTo: self.roundedBackgroundView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.roundedBackgroundView.topAnchor),
            imageView.widthAnchor.constraint(equalTo: self.roundedBackgroundView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.roundedBackgroundView.heightAnchor, multiplier: 0.6),
            
            lineView.topAnchor.constraint(equalTo: self.countryLabel.bottomAnchor, constant: 10),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.widthAnchor.constraint(equalTo: self.roundedBackgroundView.widthAnchor, multiplier: 0.5),
            lineView.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: self.lineView.bottomAnchor),
            cityLabel.centerXAnchor.constraint(equalTo: self.lineView.centerXAnchor),
            
        ])
        
    }
}

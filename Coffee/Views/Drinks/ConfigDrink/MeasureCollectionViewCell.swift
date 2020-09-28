//
//  MeasureCollectionViewCell.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class MeasureCollectionViewCell: UICollectionViewCell {
    
    
    
    lazy var cup: UILabel = {
        let cup = UILabel()
        cup.numberOfLines = 0
        cup.textAlignment = .center
        cup.adjustsFontSizeToFitWidth = true
        cup.minimumScaleFactor = 0.7
        cup.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        cup.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        cup.translatesAutoresizingMaskIntoConstraints = false
        return cup
    }()
    
    lazy var volume: UILabel = {
        let volume = UILabel()
        volume.numberOfLines = 0
        volume.textAlignment = .center
        volume.adjustsFontSizeToFitWidth = true
        volume.minimumScaleFactor = 0.7
        volume.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        volume.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        volume.translatesAutoresizingMaskIntoConstraints = false
        return volume
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell(cups: String, volume: String) {
        self.cup.text = cups
        self.volume.text = volume
    }
    override func layoutSubviews() {
        setUp()
    }
}

extension MeasureCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(cup)
        addSubview(volume)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            cup.centerXAnchor.constraint(equalTo: centerXAnchor),
            cup.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10) // é pra subir testa!!!!!!
        ])
        NSLayoutConstraint.activate([
            volume.topAnchor.constraint(equalTo: cup.bottomAnchor, constant: 10),
            volume.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 0.98, green: 0.62, blue: 0.09, alpha: 1.00).cgColor
        layer.cornerRadius = frame.size.width/2 // pra deixar redonda
    }
}

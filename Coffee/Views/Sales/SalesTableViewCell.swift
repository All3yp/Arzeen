//
//  SalesTableViewCell.swift
//  Coffee
//
//  Created by Brena Amorim on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

protocol StoreButtonSelected: class {
    func nextScreen(index: Int)
}

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
        self.backgroundColor = UIColor.blackColorCustomized
    }
    
    var index: Int?
    weak var selectedButton: StoreButtonSelected?
    
    lazy var grainNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloClaroCustomized
        label.numberOfLines = 1
        label.text = "Catuaí"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //(name: ".SFProDisplay-Bold", size: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeOfGrainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.whiteColorCustomized
        label.numberOfLines = 2
        label.text = "Variedade de café Arábica"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var storeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Amika Coffehouse", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(UIColor.amareloEscuroCustomized, for: UIControl.State())
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.7
        button.backgroundColor = UIColor.clear
        
        button.addTarget(self, action: #selector(pressedStoreButton), for: .touchUpInside)
        
        return button
    }()

    lazy var store2Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mercado do Café", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(UIColor.amareloEscuroCustomized, for: UIControl.State())
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.7
        button.backgroundColor = UIColor.clear
        button.isHidden = true
        return button
    }()

    let partition: UIView = {
        let partition = UIView()
        partition.backgroundColor = UIColor.whiteColorCustomized
        return partition
    }()

    lazy var firstStoreImageView: UIImageView = {
        let storeImage = UIImageView()
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.masksToBounds = false
        storeImage.layer.borderColor = UIColor.systemYellow.cgColor
        storeImage.layer.cornerRadius = 15
        storeImage.contentMode = .scaleAspectFill
        storeImage.clipsToBounds = true
        return storeImage
    }()

    lazy var secondStoreImageView: UIImageView = {
        let storeImage = UIImageView()
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.masksToBounds = false
        storeImage.layer.borderColor = UIColor.systemYellow.cgColor
        storeImage.layer.cornerRadius = 15
        storeImage.clipsToBounds = true
        storeImage.isHidden = true
        return storeImage
    }()
    
    @objc private func pressedStoreButton(sender: UIButton) {
        selectedButton?.nextScreen(index: index!)
    }
    
}

// Set constraints
extension SalesTableViewCell {
    
    private func setupViews() {
        self.contentView.addSubview(grainNameLabel)
        self.contentView.addSubview(typeOfGrainLabel)
        self.contentView.addSubview(partition)
        self.contentView.addSubview(firstStoreImageView)
        self.contentView.addSubview(storeButton)
        self.contentView.addSubview(secondStoreImageView)
        self.contentView.addSubview(store2Button)
    }
    
    private func setupConstraints() {
        // Permitindo a definição de autoLayout viewCode
        grainNameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeOfGrainLabel.translatesAutoresizingMaskIntoConstraints = false
        partition.translatesAutoresizingMaskIntoConstraints = false
        firstStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        storeButton.translatesAutoresizingMaskIntoConstraints = false
        secondStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        store2Button.translatesAutoresizingMaskIntoConstraints = false
        
        // Setando as constraints
        NSLayoutConstraint.activate([
           grainNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58.5),
           grainNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            typeOfGrainLabel.topAnchor.constraint(equalTo: grainNameLabel.bottomAnchor),
            typeOfGrainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            typeOfGrainLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 220)
        ])
        
        NSLayoutConstraint.activate([
            partition.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            partition.heightAnchor.constraint(equalToConstant: 115),
            partition.widthAnchor.constraint(equalToConstant: 1),
            partition.leadingAnchor.constraint(equalTo: typeOfGrainLabel.trailingAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
//            firstStoreImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 44),
            firstStoreImageView.centerYAnchor.constraint(equalTo: partition.centerYAnchor),
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
            storeButton.centerYAnchor.constraint(equalTo: firstStoreImageView.centerYAnchor),
            storeButton.leadingAnchor.constraint(equalTo: firstStoreImageView.trailingAnchor, constant: 8),
            storeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            store2Button.centerYAnchor.constraint(equalTo: secondStoreImageView.centerYAnchor),
            store2Button.leadingAnchor.constraint(equalTo: secondStoreImageView.trailingAnchor, constant: 8),
            store2Button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

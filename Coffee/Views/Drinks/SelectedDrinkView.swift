//
//  SelectedDrinkView.swift
//  Coffee
//
//  Created by Anderson Alencar on 21/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SelectedDrinkView: UIView {
    
    lazy var drinkImageView: ImageDrinkView = {
        let drinkImageView = ImageDrinkView()
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        return drinkImageView
    }()
    
    lazy var drinkName: UILabel = {
        let drinkName = UILabel()
        drinkName.numberOfLines = 0
        drinkName.text = "Moka TEste"
        drinkName.adjustsFontSizeToFitWidth = true
        drinkName.minimumScaleFactor = 0.7
        drinkName.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        drinkName.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        drinkName.translatesAutoresizingMaskIntoConstraints = false
        return drinkName
    }()
    
    lazy var descriptionDrink: UILabel = {
        let descriptionDrink = UILabel()
        descriptionDrink.numberOfLines = 0
        descriptionDrink.text = "Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste " +
            "Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste este Teste Teste"
        //descriptionDrink.adjustsFontSizeToFitWidth = true
        descriptionDrink.minimumScaleFactor = 0.7
        descriptionDrink.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionDrink.textColor = UIColor(red: 0.91, green: 0.84, blue: 0.76, alpha: 1.00)
        descriptionDrink.translatesAutoresizingMaskIntoConstraints = false
        return descriptionDrink
    }()
    
    lazy var harmonizationLabel: UILabel = {
        let harmonizationLabel = UILabel()
        harmonizationLabel.numberOfLines = 0
        harmonizationLabel.text = "Combina com:"
        harmonizationLabel.adjustsFontSizeToFitWidth = true
        harmonizationLabel.minimumScaleFactor = 0.7
        harmonizationLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        harmonizationLabel.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        harmonizationLabel.translatesAutoresizingMaskIntoConstraints = false
        return harmonizationLabel
    }()
    
    lazy var harmonizationCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let harmonizationCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        harmonizationCollection.register(HarmonizationCollectionViewCell.self, forCellWithReuseIdentifier: "harmCell")
        harmonizationCollection.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
        harmonizationCollection.showsHorizontalScrollIndicator = false
        harmonizationCollection.isPagingEnabled = false
        harmonizationCollection.contentInsetAdjustmentBehavior = .never
        harmonizationCollection.collectionViewLayout = flowLayout
        harmonizationCollection.delegate = self
        harmonizationCollection.dataSource = self
        harmonizationCollection.translatesAutoresizingMaskIntoConstraints = false
        return harmonizationCollection
    }()
    
    lazy var buttonPrepare: UIButton = {
        let buttonPrepare = UIButton()
        buttonPrepare.setTitle("Preparar", for: .normal)
        buttonPrepare.layer.cornerRadius = 15
        buttonPrepare.backgroundColor = UIColor(red: 0.98, green: 0.62, blue: 0.09, alpha: 1.00)
        buttonPrepare.translatesAutoresizingMaskIntoConstraints = false
        return buttonPrepare
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

extension SelectedDrinkView: ViewCode {
    func buildHierarchy() {
        addSubview(drinkImageView)
        addSubview(drinkName)
        addSubview(descriptionDrink)
        addSubview(harmonizationLabel)
        addSubview(harmonizationCollection)
        addSubview(buttonPrepare)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            drinkImageView.topAnchor.constraint(equalTo: topAnchor),
            drinkImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            drinkImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            drinkImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.31)
        ])
        NSLayoutConstraint.activate([
            drinkName.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor, constant: 0),
            drinkName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            drinkName.trailingAnchor.constraint(equalTo: trailingAnchor),
            drinkName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07)
        ])
        NSLayoutConstraint.activate([
            descriptionDrink.topAnchor.constraint(equalTo: drinkName.bottomAnchor, constant: 5),
            descriptionDrink.leadingAnchor.constraint(equalTo: drinkName.leadingAnchor),
            descriptionDrink.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            harmonizationLabel.topAnchor.constraint(equalTo: descriptionDrink.bottomAnchor, constant: 10),
            harmonizationLabel.leadingAnchor.constraint(equalTo: descriptionDrink.leadingAnchor),
            harmonizationLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            harmonizationCollection.topAnchor.constraint(equalTo: harmonizationLabel.bottomAnchor, constant: 20),
            harmonizationCollection.leadingAnchor.constraint(equalTo: harmonizationLabel.leadingAnchor),
            harmonizationCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            harmonizationCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.17)
        ])
        
        NSLayoutConstraint.activate([
            buttonPrepare.topAnchor.constraint(equalTo: harmonizationCollection.bottomAnchor, constant: 10),
            buttonPrepare.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonPrepare.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            buttonPrepare.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06),
            buttonPrepare.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)

    }
}

extension SelectedDrinkView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "harmCell", for: indexPath) as! HarmonizationCollectionViewCell
        cell.configCell(imageFood: UIImage(named: "chemex")!, nameFood: "Totar de Abóbora")
        return cell
    }
}

extension SelectedDrinkView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = harmonizationCollection.bounds
        return CGSize(width: size.width/2, height: size.width/2.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0) // adicionar espaçamento interno a célula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}

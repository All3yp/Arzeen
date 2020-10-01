//
//  ConfigDrinkView.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ConfigDrinkView: UIView {

    lazy var drinkImageView: UIImageView = {
        let drinkImageView = UIImageView()
        drinkImageView.image = UIImage(named: "chemex")
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        return drinkImageView
    }()
    
    lazy var backgroundView: BackgroundConfigView = {
        let backgroundView = BackgroundConfigView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
        return backgroundView
    }()
    
    lazy var drinkName: UILabel = {
        let drinkName = UILabel()
        drinkName.numberOfLines = 0
        drinkName.text = "Moka Teste"
        drinkName.adjustsFontSizeToFitWidth = true
        drinkName.minimumScaleFactor = 0.7
        drinkName.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        drinkName.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        drinkName.translatesAutoresizingMaskIntoConstraints = false
        return drinkName
    }()
    
    lazy var processLabel: UILabel = {
        let processLabel = UILabel()
        processLabel.numberOfLines = 0
        processLabel.text = "Selecione o processo:"
        processLabel.adjustsFontSizeToFitWidth = true
        processLabel.minimumScaleFactor = 0.7
        processLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        processLabel.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        processLabel.translatesAutoresizingMaskIntoConstraints = false
        return processLabel
    }()
    
    lazy var processCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let processCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        processCollection.register(ProcessCollectionViewCell.self, forCellWithReuseIdentifier: "processCell")
        processCollection.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
        processCollection.showsHorizontalScrollIndicator = false
        processCollection.isPagingEnabled = false
        processCollection.contentInsetAdjustmentBehavior = .never
        processCollection.collectionViewLayout = flowLayout
        processCollection.delegate = self
        processCollection.dataSource = self
        processCollection.translatesAutoresizingMaskIntoConstraints = false
        return processCollection
    }()
    
    lazy var descriptionProcess: UILabel = {
        let processLabel = UILabel()
        processLabel.numberOfLines = 0
        processLabel.layer.cornerRadius = 8
        processLabel.clipsToBounds = true
        processLabel.text = "A intensidade do café nesse método pode ser bastante intensa e ácida"
        processLabel.textAlignment = .center
        processLabel.adjustsFontSizeToFitWidth = true
        processLabel.minimumScaleFactor = 0.7
        processLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        processLabel.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        processLabel.backgroundColor = UIColor(red: 0.16, green: 0.12, blue: 0.13, alpha: 1.00)
        processLabel.translatesAutoresizingMaskIntoConstraints = false
        return processLabel
    }()
    
    lazy var drinkMeasureCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let drinkMeasureCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        drinkMeasureCollection.register(MeasureCollectionViewCell.self, forCellWithReuseIdentifier: "measureCell")
        drinkMeasureCollection.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
        drinkMeasureCollection.showsHorizontalScrollIndicator = false
        drinkMeasureCollection.isPagingEnabled = false
        drinkMeasureCollection.contentInsetAdjustmentBehavior = .never
        drinkMeasureCollection.collectionViewLayout = flowLayout
        drinkMeasureCollection.delegate = self
        drinkMeasureCollection.dataSource = self
        drinkMeasureCollection.translatesAutoresizingMaskIntoConstraints = false
        return drinkMeasureCollection
    }()
    
    lazy var buttonInit: UIButton = {
        let buttonInit = UIButton()
        buttonInit.setTitle("Preparar", for: .normal)
        buttonInit.layer.cornerRadius = 15
        buttonInit.backgroundColor = UIColor(red: 0.98, green: 0.62, blue: 0.09, alpha: 1.00)
        buttonInit.translatesAutoresizingMaskIntoConstraints = false
        return buttonInit
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

extension ConfigDrinkView: ViewCode {
    func buildHierarchy() {
        addSubview(drinkImageView)
        addSubview(backgroundView)
        addSubview(drinkName)
        addSubview(processLabel)
        addSubview(processCollection)
        addSubview(descriptionProcess)
        addSubview(drinkMeasureCollection)
        addSubview(buttonInit)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            drinkImageView.topAnchor.constraint(equalTo: topAnchor),
            drinkImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            drinkImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            drinkImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.31)
        ])
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor, constant: -20), // é pra subir////
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            drinkName.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            drinkName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            drinkName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            drinkName.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            drinkName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            drinkName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            processLabel.topAnchor.constraint(equalTo: drinkName.bottomAnchor, constant: 20),
            processLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            processLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            processCollection.topAnchor.constraint(equalTo: processLabel.bottomAnchor, constant: 10),
            processCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            processCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            processCollection.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
        NSLayoutConstraint.activate([
            descriptionProcess.topAnchor.constraint(equalTo: processCollection.bottomAnchor, constant: 10),
            descriptionProcess.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionProcess.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            descriptionProcess.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.09)
        ])
        NSLayoutConstraint.activate([
            drinkMeasureCollection.topAnchor.constraint(equalTo: descriptionProcess.bottomAnchor, constant: 5),
            drinkMeasureCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            drinkMeasureCollection.trailingAnchor.constraint(equalTo: trailingAnchor)
            //drinkMeasureCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonInit.topAnchor.constraint(equalTo: drinkMeasureCollection.bottomAnchor, constant: 5),
            buttonInit.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonInit.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.055),
            buttonInit.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65),
            buttonInit.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .white
    }
}

extension ConfigDrinkView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case self.processCollection:
                return 6
            default:
                return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case self.processCollection:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "processCell", for: indexPath) as! ProcessCollectionViewCell
                cell.configCell(processIcon: UIImage(named: "expresso")!, nameProcess: "Hario16")
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "measureCell", for: indexPath) as! MeasureCollectionViewCell
                cell.prepareCell(cups: "1 xícara", volume: "200ml")
                return cell
        }
        
    }
}

extension ConfigDrinkView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            case self.processCollection:
                let size = processCollection.bounds
                return CGSize(width: size.width/3.7, height: size.width/4.7)
            default:
                let size = drinkMeasureCollection.bounds
                return CGSize(width: size.width/4, height: size.width/4)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
            case self.processCollection:
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // adicionar espaçamento interno a célula
            default:
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0) // adicionar espaçamento interno a célula
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}

//
//  GrainsCollectionViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 24/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit

class GrainsCollectionViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigation()
    }
    // MARK: - Properties
    
    let grains: [Grain] = [
        
        Grain.init(imageName: "ArabicaGrain", name: "Arábica", state: "Rio Grande do Norte",
                   country: "Brasil", finalization: 1, contrast: 9, torra: 3),
        Grain.init(imageName: "CatuaiGrain", name: "Catuaí", state: "Minas Gerais",
                   country: "Brasil", finalization: 4, contrast: 7, torra: 5),
        Grain.init(imageName: "ArabicaGrain", name: "Robusta", state: "Acre",
                   country: "Brasil", finalization: 4, contrast: 5, torra: 1)
    ]
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(GrainsCollectionViewCell.self, forCellWithReuseIdentifier: "GrainsCollectionViewCell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var sliderOneUIView: SliderGrainsView = {
        let view = SliderGrainsView(frame: .zero)
        view.leftLabelSlider.text = "SUAVE"
        view.rightLabelSlider.text = "FORTE"
        view.topLabelSlider.text = "Finalização"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sliderTwoUIView: SliderGrainsView = {
        let view = SliderGrainsView(frame: .zero)
        view.leftLabelSlider.text = "ÁCIDO"
        view.rightLabelSlider.text = "AMARGO"
        view.topLabelSlider.text = "Contraste"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sliderThreeUIView: SliderGrainsView = {
        let view = SliderGrainsView(frame: .zero)
        view.leftLabelSlider.text = "CLARA"
        view.rightLabelSlider.text = "ESCURA"
        view.topLabelSlider.text = "Torra"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

// MARK: - UI Setup
extension GrainsCollectionViewController {
    
    private func setupNavigation() {
        navigationItem.title = "Grãos"
        self.navigationItem.largeTitleDisplayMode = .always //Sempre com largeTitle
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundImage = UIImage(named: "GrainsLogo")
            appearance.backgroundImageContentMode = .scaleAspectFill
            appearance.shadowColor = .clear
            return appearance
        }()
        
        // Usando o cornerRadius e o clips to bounds, ele corta a parte da status bar tambem
//        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        self.navigationController?.navigationBar.layer.cornerRadius = 50
//        self.navigationController?.navigationBar.clipsToBounds = true
    }
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = UIColor.blackColorCustomized
        
        self.view.addSubview(collectionView)
        self.view.addSubview(sliderOneUIView)
        self.view.addSubview(sliderTwoUIView)
        self.view.addSubview(sliderThreeUIView)
        //        self.view.addSubview(sliderTwo)
        
        NSLayoutConstraint.activate([
            //            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
            
            sliderOneUIView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sliderOneUIView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            sliderOneUIView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            
            sliderTwoUIView.topAnchor.constraint(equalTo: self.sliderOneUIView.bottomAnchor, constant: 15),
            sliderTwoUIView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            sliderTwoUIView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            
            sliderThreeUIView.topAnchor.constraint(equalTo: self.sliderTwoUIView.bottomAnchor, constant: 15),
            sliderThreeUIView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            sliderThreeUIView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            
        ])
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.57
        
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: cellWidthHeightConstant+14, height: cellWidthHeightConstant)
        
        return layout
    }
}

// MARK: - UICollectionViewDelegate & Data Source
extension GrainsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grains.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrainsCollectionViewCell", for: indexPath) as! GrainsCollectionViewCell
        cell.imageView.image = UIImage(named: grains[indexPath.row].imageName)
        cell.grainLabel.text = grains[indexPath.row].name
        cell.cityLabel.text = grains[indexPath.row].state
        cell.countryLabel.text = grains[indexPath.row].country
        
        return cell
    }
}

extension GrainsCollectionViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = view.convert(collectionView.center, to: collectionView)
        guard
            let indexPath = collectionView.indexPathForItem(at: point),
            indexPath.item < grains.count
        else {
            return
        }
        let grain = grains[indexPath.item]
        sliderOneUIView.slider.setValue(Float(grain.finalization), animated: true)
        sliderTwoUIView.slider.setValue(Float(grain.contrast), animated: true)
        sliderThreeUIView.slider.setValue(Float(grain.torra), animated: true)
    }
}

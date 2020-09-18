//
//  OnboardingViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 17/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

// swiftlint:disable  line_length
class CollectionOnboardViewController: UIViewController, UICollectionViewDelegate {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.whiteColorCustomized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.amareloEscuroCustomized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonWasTapped), for: .touchUpInside)
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = UIColor.amareloEscuroCustomized
        pageControl.pageIndicatorTintColor = UIColor.whiteColorCustomized
        return pageControl
    }()
    
    @objc private func nextButtonWasTapped() {
        
        if pageControl.currentPage == 1 {
            
            self.dismiss(animated: true, completion: nil)
            
        } else {            
            
            collectionView.selectItem(at: IndexPath(row: 1, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            
        }
    }
    
    @objc private func skipButtonWasTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    private var onboarding = [Onboards]()
    
    init(onboard: [Onboards] = Onboards.mockOnboard()) {
        super.init(nibName: nil, bundle: nil)
        pageControl.numberOfPages = onboard.count
        self.onboarding = onboard
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.globalMarromColor
        constructView()
        setupLayout()
        setupButtonControls()
    }
    
    private func constructView() {
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.addSubview(pageControl)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    fileprivate func setupButtonControls() {
        let buttomControlsStackView = UIStackView(arrangedSubviews: [skipButton, pageControl, nextButton])
        buttomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControlsStackView.distribution = .fillEqually
        
        view.addSubview(buttomControlsStackView)
        
        NSLayoutConstraint.activate([
            buttomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension CollectionOnboardViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell {
            cell.onboardImageView.image = UIImage(named: onboarding[indexPath.row].image)
            cell.descriptionOnboard.text = onboarding[indexPath.row].subtitle
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.nextButton.setTitle((indexPath.row == 1 ? "Start" : "Next"), for: .normal)
        pageControl.currentPage = indexPath.row
    }
    
}

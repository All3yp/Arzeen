//
//  OnboardingViewController.swift
//  Coffee
//
//  Created by Alley Pereira on 17/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

// swiftlint:disable  line_length vertical_whitespace identifier_name
class OnboardingViewController: UIViewController {
    
    let onboardImageView: UIImageView = {
        let imageView = UIImageView()
        let coffeeOnboard = UIImage(named: "CoffeeOnboarding")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = coffeeOnboard
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Dê uma pausa no seu dia, tenha boas experiências no preparo do seu café, experimente os diferentes métodos de preparo e aprecie o resultado final",
                                                       attributes: [NSAttributedString.Key.font:
                                                        UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.amareloClaroCustomized!])
        
        textView.backgroundColor = UIColor.clear
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.whiteColorCustomized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.amareloEscuroCustomized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 2
        pc.currentPageIndicatorTintColor = UIColor.amareloEscuroCustomized
        pc.pageIndicatorTintColor = UIColor.whiteColorCustomized
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(onboardImageView)
        view.backgroundColor = UIColor.globalMarromColor
        view.addSubview(descriptionTextView)
        
        setupLayout()
        setupButtonControls()
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
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(onboardImageView)
        
        onboardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        onboardImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        onboardImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        onboardImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
}

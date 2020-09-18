//
//  OnboardingCollectionViewCell.swift
//  Coffee
//
//  Created by Alley Pereira on 18/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

// swiftlint:disable superfluous_disable_command
class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "onboardingCell"
    
    let onboardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let descriptionOnboard: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.amareloClaroCustomized
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        constructView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constructView() {
        self.addSubview(onboardImageView)
        self.addSubview(descriptionOnboard)
    }
    
    private func setupLayout() {
        
        onboardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        onboardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        onboardImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        onboardImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        descriptionOnboard.topAnchor.constraint(equalTo: onboardImageView.bottomAnchor, constant: 50).isActive = true
        
        descriptionOnboard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        descriptionOnboard.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
        descriptionOnboard.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25).isActive = true
    }
}

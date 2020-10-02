//
//  ImageDrinkView.swift
//  Coffee
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ImageDrinkView: UIView {

    lazy var drinkImage: UIImageView = {
        let drinkImage = UIImageView()
        drinkImage.clipsToBounds = true
        drinkImage.contentMode = .scaleAspectFill
        drinkImage.image = UIImage(named: "Drink\(image!)")
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        return drinkImage
    }()
    var image: Int?
    init(frame: CGRect, photo: Int) {
        super.init(frame: frame)
        image = photo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
        setUp()
    }
    
}

extension ImageDrinkView: ViewCode {
    func buildHierarchy() {
        addSubview(drinkImage)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            drinkImage.topAnchor.constraint(equalTo: topAnchor),
            drinkImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            drinkImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            drinkImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = .white
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

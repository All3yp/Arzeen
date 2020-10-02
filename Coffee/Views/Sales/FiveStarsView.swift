//
//  FiveStarsView.swift
//  Coffee
//
//  Created by Brena Amorim on 27/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class FiveStarsView: UIView {
    
    var rate = Int()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(rate: Int) {
        self.init(frame: .zero)
        self.rate = rate
        rating()
        setupStarViews()
        setupStarContraints()
    }
    
    var star1: StarView!
    var star2: StarView!
    var star3: StarView!
    var star4: StarView!
    var star5: StarView!
    
    func animate() {
        star1.animateStar()
        star2.animateStar()
        star3.animateStar()
        star4.animateStar()
        star5.animateStar()
    }
    
    func rating() {
        
        switch rate {
            case 1:
                star1 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star2 = StarView(starColor: UIColor.clear.cgColor)
                star3 = StarView(starColor: UIColor.clear.cgColor)
                star4 = StarView(starColor: UIColor.clear.cgColor)
                star5 = StarView(starColor: UIColor.clear.cgColor)
            case 2:
                star1 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star2 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star3 = StarView(starColor: UIColor.clear.cgColor)
                star4 = StarView(starColor: UIColor.clear.cgColor)
                star5 = StarView(starColor: UIColor.clear.cgColor)
            case 3:
                star1 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star2 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star3 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star4 = StarView(starColor: UIColor.clear.cgColor)
                star5 = StarView(starColor: UIColor.clear.cgColor)
            case 4:
                star1 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star2 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star3 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star4 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star5 = StarView(starColor: UIColor.clear.cgColor)
            case 5:
                star1 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star2 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star3 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star4 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
                star5 = StarView(starColor: UIColor.amareloEscuroCustomized!.cgColor)
            default:
                break
        }
        
    }
    
    func setupStarViews() {
        self.addSubview(star1)
        self.addSubview(star2)
        self.addSubview(star3)
        self.addSubview(star4)
        self.addSubview(star5)
        
    }
    
    func setupStarContraints() {
        star1.translatesAutoresizingMaskIntoConstraints = false
        star2.translatesAutoresizingMaskIntoConstraints = false
        star3.translatesAutoresizingMaskIntoConstraints = false
        star4.translatesAutoresizingMaskIntoConstraints = false
        star5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            star1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            star1.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            star1.heightAnchor.constraint(equalToConstant: 13),
            star1.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
        NSLayoutConstraint.activate([
            star2.centerYAnchor.constraint(equalTo: star1.centerYAnchor),
            star2.leadingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 4),
            star2.heightAnchor.constraint(equalToConstant: 13),
            star2.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
        NSLayoutConstraint.activate([
            star3.centerYAnchor.constraint(equalTo: star2.centerYAnchor),
            star3.leadingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 4),
            star3.heightAnchor.constraint(equalToConstant: 13),
            star3.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
        NSLayoutConstraint.activate([
            star4.centerYAnchor.constraint(equalTo: star3.centerYAnchor),
            star4.leadingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 4),
            star4.heightAnchor.constraint(equalToConstant: 13),
            star4.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
        NSLayoutConstraint.activate([
            star5.centerYAnchor.constraint(equalTo: star4.centerYAnchor),
            star5.leadingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 4),
            star5.heightAnchor.constraint(equalToConstant: 13),
            star5.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
    }
    
}

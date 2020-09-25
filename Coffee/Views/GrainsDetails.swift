//
//  GrainsDetails.swift
//  Coffee
//
//  Created by Cristiano Coutinho on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class GrainsTableViewCell: UITableViewCell{
    
    // Inicialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupGrainsViews()
        setupGrainsConstraints()
        self.backgroundColor = UIColor.backgroundColor
    }
    
    lazy var testLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = UIColor.titleColor
        label.numberOfLines = 1
        label.text = "Teste"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //(name: ".SFProDisplay-Bold", size: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension GrainsTableViewCell{
    
    func setupGrainsViews(){
        self.contentView.addSubview(testLabel)
    }
    
    func setupGrainsConstraints(){
        // Permitindo a definição de autoLayout viewCode
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setando as constraints
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 58.5),
            testLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            //            grainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50.5)
        ])
    }
    
}

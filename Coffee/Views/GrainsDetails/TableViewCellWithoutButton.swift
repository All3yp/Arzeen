//
//  GrainsDetails.swift
//  Coffee
//
//  Created by Cristiano Coutinho on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class GrainsTableViewCellWithoutButton: UITableViewCell{
    
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
        self.backgroundColor = UIColor.globalMarromColor
    }
    
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloClaroCustomized
        label.text = "Espécie"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var describeGrainLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.whiteColorCustomized
        label.numberOfLines = 0
        label.text = "Conteudo Conteudo Conteudo Conteudo Conteudo Conteudo Conteudo "
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension GrainsTableViewCellWithoutButton{
    
    func setupGrainsViews(){
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(describeGrainLabel)
    }
    
    func setupGrainsConstraints(){
        
        // Setando as constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:self.topAnchor, constant: 13),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        
        NSLayoutConstraint.activate([
            describeGrainLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            describeGrainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            describeGrainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
}

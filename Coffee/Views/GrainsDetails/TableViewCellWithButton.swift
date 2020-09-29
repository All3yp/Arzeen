//
//  TableViewCellWithButton.swift
//  Coffee
//
//  Created by Cristiano Coutinho on 28/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class GrainsTableViewCellWithButton: UITableViewCell{
    
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
        self.backgroundColor = UIColor.white
    }
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.amareloClaroCustomized
        label.text = "Espécie"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.backgroundColor = UIColor.globalMarromColor
        button.setTitle("Arabica", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        //button.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor.whiteColorCustomized, for: UIControl.State())
        button.layer.cornerRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}

extension GrainsTableViewCellWithButton{
    
    func setupGrainsViews(){
        self.contentView.addSubview(cellButton)
        self.contentView.addSubview(titleLabel)
    }
    
    func setupGrainsConstraints(){
        
        // Setando as constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:self.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            cellButton.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 16),
            cellButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cellButton.widthAnchor.constraint(equalToConstant: 245),
            cellButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}

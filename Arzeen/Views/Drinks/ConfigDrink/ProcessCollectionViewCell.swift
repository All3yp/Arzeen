//
//  ProcessCollectionViewCell.swift
//  Arzeen
//
//  Created by Anderson Alencar on 23/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class ProcessCollectionViewCell: UICollectionViewCell {
    
    lazy var processIcon: UIImageView = {
        let processIcon = UIImageView()
        processIcon.clipsToBounds = true
        processIcon.contentMode = .scaleAspectFit
        processIcon.translatesAutoresizingMaskIntoConstraints = false
        return processIcon
    }()
    
    lazy var nameProcess: UILabel = {
        let nameProcess = UILabel()
        nameProcess.numberOfLines = 0
        nameProcess.textAlignment = .center
        nameProcess.adjustsFontSizeToFitWidth = true
        nameProcess.minimumScaleFactor = 0.7
        nameProcess.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameProcess.textColor = UIColor(red: 1.00, green: 0.74, blue: 0.36, alpha: 1.00)
        nameProcess.translatesAutoresizingMaskIntoConstraints = false
        return nameProcess
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(processIcon: UIImage, nameProcess: String) {
        self.processIcon.image = processIcon
        self.nameProcess.text = nameProcess
    }
    
    override func layoutSubviews() {
        setUp()
    }
}

extension ProcessCollectionViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(processIcon)
        addSubview(nameProcess)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            processIcon.topAnchor.constraint(equalTo: topAnchor),
            processIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            processIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            processIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
        ])
        NSLayoutConstraint.activate([
            nameProcess.topAnchor.constraint(equalTo: processIcon.bottomAnchor, constant: 7),
            nameProcess.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameProcess.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameProcess.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.07, alpha: 1.00)
    }
}

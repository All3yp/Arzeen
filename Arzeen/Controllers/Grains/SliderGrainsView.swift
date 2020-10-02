//
//  SliderGrainsView.swift
//  Arzeen
//
//  Created by Alley Pereira on 24/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit
//swiftlint: disable identifier_name

class SliderGrainsView: UIView {
        
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 250, height: 35)
        slider.minimumTrackTintColor = .orange
        slider.maximumTrackTintColor = .orange
        slider.thumbTintColor = .systemYellow
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.setThumbImage(UIImage(named: "bolaThumb"), for: .normal)
        slider.setThumbImage(UIImage(named: "bolaThumb"), for: .highlighted)
        slider.setMinimumTrackImage(UIImage(named: "trackImage"), for: .normal)
        slider.setMaximumTrackImage(UIImage(named: "trackImage"), for: .normal)
        slider.isUserInteractionEnabled = false
        slider.setValue(5, animated: false)
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var topLabelSlider: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.amareloEscuroCustomized // mudar dps
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftLabelSlider: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.yellowGrainsCustomized
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightLabelSlider: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.yellowGrainsCustomized
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func changeSelectedGrain(grain: Grain) {
        self.slider.value = Float(grain.finalization)
        self.slider.value = Float(grain.contrast)
        self.slider.value = Float(grain.torra)
    }
    
    @objc func changeValue(_ sender: UISlider) {
        print("O valor é ", Float(sender.value))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(slider)
        addSubview(topLabelSlider)
        addSubview(leftLabelSlider)
        addSubview(rightLabelSlider)

        NSLayoutConstraint.activate([
            
            slider.topAnchor.constraint(equalTo: self.topLabelSlider.topAnchor, constant: 30),
            slider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            slider.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.48),
            slider.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            topLabelSlider.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topLabelSlider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topLabelSlider.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            
            leftLabelSlider.rightAnchor.constraint(equalTo: self.slider.leftAnchor, constant: -5),
            leftLabelSlider.centerYAnchor.constraint(equalTo: self.slider.centerYAnchor),
            leftLabelSlider.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            rightLabelSlider.leftAnchor.constraint(equalTo: self.slider.rightAnchor, constant: 5),
            rightLabelSlider.centerYAnchor.constraint(equalTo: self.slider.centerYAnchor),
            rightLabelSlider.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5)
        ])
    }
}

//
//  TimerView.swift
//  Coffee
//
//  Created by Alley Pereira on 30/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import Foundation
import UIKit

class TimerView: UIView {

    lazy var circle: CAShapeLayer = {
        var circle = CAShapeLayer()
        circle.strokeColor = UIColor.amareloEscuroCustomized?.cgColor
        circle.strokeEnd = 1
        circle.lineWidth = 12
//        circle.fillColor = UIColor.clear.cgColor
        circle.fillColor = UIColor.globalMarromColor?.cgColor

        circle.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        return circle
    }()

    lazy var shadowCircle: CAShapeLayer = {
        var circle = CAShapeLayer()
        circle.strokeColor = UIColor.systemGray.cgColor
        circle.strokeEnd = 1
        circle.lineWidth = 13
        circle.fillColor = UIColor.clear.cgColor

        circle.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        return circle
    }()

    var timeLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 56, weight: .bold)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func pause() {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }

    func resume() {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCircleTime()
        setupTimeLabel()
    }

    func setAnimation(with animation: CABasicAnimation) {
        self.circle.add(animation, forKey: "StrokeEnd")
    }

    private func setupCircleTime() {
        let positionX = self.frame.width/2
        let positionY = self.frame.height/2

        let path = UIBezierPath(arcCenter: .zero, radius: positionY, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        self.circle.path = path.cgPath
        self.circle.position  = CGPoint(x: positionX, y: positionY)

        self.shadowCircle.path = path.cgPath
        self.shadowCircle.position  = CGPoint(x: positionX, y: positionY)

        self.layer.addSublayer(shadowCircle)
        self.layer.addSublayer(circle)
    }

    private func setupTimeLabel() {
        self.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

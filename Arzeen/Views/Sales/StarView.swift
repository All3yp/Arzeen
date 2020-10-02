//
//  StarView.swift
//  Arzeen
//
//  Created by Brena Amorim on 27/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    var shapeLayer = CAShapeLayer()
    
    var starColor: CGColor = UIColor.black.cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(starColor: CGColor) {
        self.init(frame: .zero)
        self.starColor = starColor
        
        let starLayer = starShape(fillColor: starColor)
        let star = setStar(starShape: starLayer)
        
        setupViews(view: star)
        setupContraints(view: star)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(view: UIView) {
        self.addSubview(view)
    }
    
    func setupContraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 13),
            view.widthAnchor.constraint(equalToConstant: 13)
            
        ])
        
    }
    
    func starShape(fillColor: CGColor) -> CAShapeLayer {
        
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 13.0, height: 13.0)
        shapeLayer.lineWidth = 1.0
        shapeLayer.strokeColor = UIColor.amareloEscuroCustomized?.cgColor
        
        let starPath = UIBezierPath()
        
        _ = shapeLayer.bounds
        let center = shapeLayer.position
        
        let numberOfPoints = CGFloat(5.0)
        let numberOfLineSegments = Int(numberOfPoints * 2.0)
        let theta = .pi / numberOfPoints
        
        let circumscribedRadius = center.x
        let outerRadius = circumscribedRadius * 1.039
        let excessRadius = outerRadius - circumscribedRadius
        let innerRadius = CGFloat(outerRadius * 0.382)
        
        let leftEdgePointX = (center.x + cos(4.0 * theta) * outerRadius) + excessRadius
        let horizontalOffset = leftEdgePointX / 2.0
        
        // Apply a slight horizontal offset so the star appears to be more
        // centered visually
        let offsetCenter = CGPoint(x: center.x - horizontalOffset, y: center.y)
        
        // Alternate between the outer and inner radii while moving evenly along the
        // circumference of the circle, connecting each point with a line segment
        for index in 0..<numberOfLineSegments {
            let radius = index % 2 == 0 ? outerRadius : innerRadius
            
            let pointX = offsetCenter.x + cos(CGFloat(index) * theta) * radius
            let pointY = offsetCenter.y + sin(CGFloat(index) * theta) * radius
            let point = CGPoint(x: pointX, y: pointY)
            
            if index == 0 {
                starPath.move(to: point)
            } else {
                starPath.addLine(to: point)
            }
        }
        
        starPath.close()
        
        // Rotate the path so the star points up as expected
        var pathTransform  = CGAffineTransform.identity
        pathTransform = pathTransform.translatedBy(x: center.x, y: center.y)
        pathTransform = pathTransform.rotated(by: CGFloat(-.pi / 2.0))
        pathTransform = pathTransform.translatedBy(x: -center.x, y: -center.y)
        
        starPath.apply(pathTransform)
        
        shapeLayer.path = starPath.cgPath
        shapeLayer.fillColor = fillColor

        return shapeLayer
        
    }
    //Set the shape of star and basic animation
    
    func animateStar() {
        
        // MARK: Animation Fill Color
                
        let fillColorAnimation = CABasicAnimation(keyPath: "fillColor")
        fillColorAnimation.toValue = UIColor.clear.cgColor
        fillColorAnimation.duration = 0.5
        fillColorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fillColorAnimation.autoreverses = true
        fillColorAnimation.repeatCount = 1
        
        shapeLayer.add(fillColorAnimation, forKey: "fillColorAnimation")
        
    }
    
    func setStar(starShape: CAShapeLayer) -> UIView {
        let  star = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 13.0, height: 13.0))
        
        star.layer.addSublayer(starShape)
        
        return star
    }
    //Set star in an UIView
    
}

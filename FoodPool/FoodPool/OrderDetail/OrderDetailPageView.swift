//
//  OrderDetailPageView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 14.03.2022.
//

import Foundation
import UIKit

class OrderDetailPageView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let circularPath = UIBezierPath(arcCenter: frame.origin, radius: 100, startAngle: .pi / -2, endAngle: .pi * 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.secondaryColor.cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.mainColor.cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        layer.addSublayer(trackLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation(endValue: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = endValue
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
}

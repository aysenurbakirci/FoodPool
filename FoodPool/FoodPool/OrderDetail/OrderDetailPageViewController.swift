//
//  OrderDetailPageViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit

class OrderDetailPageViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let lineWidth: CGFloat = 10.0
    let color: UIColor = .black
    let duration: TimeInterval = 2
    let endValue = 0.7

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: .pi / -2, endAngle: .pi * 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = color.withAlphaComponent(0.2).cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = endValue
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
}

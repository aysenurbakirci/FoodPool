//
//  OrderDetailPageViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit

final class OrderDetailPageViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background

        let circularPath = UIBezierPath(arcCenter: view.center, radius: 120, startAngle: .pi / -2, endAngle: .pi * 2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.secondaryColor.cgColor
        trackLayer.lineWidth = 16
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.mainColor.cgColor
        trackLayer.lineWidth = 16
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(trackLayer)
        
        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(tapHandle)))
    }
    
    @objc func tapHandle() {
        print("click")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.7
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

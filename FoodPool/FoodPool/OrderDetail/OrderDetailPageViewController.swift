//
//  OrderDetailPageViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

class OrderDetailPageViewController: UIViewController {
    
    var viewModel: OrderDetailPageViewModelProtocol!
    var orderView = OrderDetailPageView()
    
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private let lineWidth: CGFloat = 16.0
    private let color: UIColor = .mainColor
    private let duration: TimeInterval = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        layerConfig()
        view.addSubview(orderView)
        orderView.centerToSuperView()
        orderView.apply(stateTitle: viewModel.orderState.title,
                        stateIcon: viewModel.orderState.icon)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationConfig()
    }
    
    private func layerConfig() {
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 160, startAngle: .pi / -2, endAngle: .pi * 2, clockwise: true)
        
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
    
    private func animationConfig() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = viewModel.orderState.rawValue
        basicAnimation.duration = duration
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

//
//  Toast.swift
//  FoodPoolKit
//
//  Created by Ayşe Nur Bakırcı on 29.03.2022.
//

import Foundation
import UIKit

public extension UIViewController {
    func showToast(message: String) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = .mainColor
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 20;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(10.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        self.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let centerX = NSLayoutConstraint(
            item: toastLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: toastContainer,
            attribute: .centerXWithinMargins,
            multiplier: 1,
            constant: 0
        )
        
        let lableBottom = NSLayoutConstraint(
            item: toastLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: toastContainer,
            attribute: .bottom,
            multiplier: 1,
            constant: -15
        )
        
        let lableTop = NSLayoutConstraint(
            item: toastLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: toastContainer,
            attribute: .top,
            multiplier: 1,
            constant: 15
        )
        
        toastContainer.addConstraints([centerX, lableBottom, lableTop])

        let containerCenterX = NSLayoutConstraint(
            item: toastContainer,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        let containerTrailing = NSLayoutConstraint(
            item: toastContainer,
            attribute: .width,
            relatedBy: .equal,
            toItem: toastLabel,
            attribute: .width,
            multiplier: 1.1,
            constant: 0
        )
        
        let containerBottom = NSLayoutConstraint(
            item: toastContainer,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .bottom,
            multiplier: 1,
            constant: -90
        )
        
        self.view.addConstraints([containerCenterX,containerTrailing, containerBottom])

        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 1.0,
                           options: .curveEaseOut,
                           animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}

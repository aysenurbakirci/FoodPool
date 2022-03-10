//
//  BasketView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 23.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class BasketView: UIView {
    
    lazy var title: UILabel = .create(
        lblText: "Meal Name",
        font: .boldLarge,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var price: UILabel = .create(
        lblText: "00.00",
        font: .small,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, price],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .leading,
        spacing: 2
    )
    
    lazy var stepper = StepperView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(labelStack, stepper)
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          padding: .equalPadding(10.0))
        stepper.anchor(trailing: trailingAnchor,
                       padding: .padding(right: 10.0))
        stepper.centerYToSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(title: String, price: Double, count: Double) {
        self.title.text = title
        self.price.text = "\(price) $"
        stepper.stepperValue = Int(count)
    }
    
    public func addTarget(_ target: Any?) {
        stepper.stepperTarget = target
    }
}

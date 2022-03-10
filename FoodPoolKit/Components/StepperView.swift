//
//  StepperView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 22.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class StepperView: UIView {
    
    private lazy var incrementButton: UIButton = .create(
        type: .system,
        image: .plusFillAndCircular,
        tintColor: .secondaryColor,
        sizeToFit: true
    )
    
    private lazy var decrementButton: UIButton = .create(
        type: .system,
        image: .minusFillAndCircular,
        tintColor: .secondaryColor,
        sizeToFit: true
    )
    
    private lazy var stepperLabel: UILabel = .create(
        lblText: "0",
        font: .boldMedium,
        textColor: .secondaryTitle,
        textAlignment: .center,
        sizeToFit: true
    )
    
    private lazy var stack: UIStackView = .create(
        subviews: [decrementButton, stepperLabel, incrementButton],
        axis: .horizontal,
        distribution: .equalCentering,
        alignment: .center,
        spacing: 5.0
    )
    
    public lazy var stepperValue: Int = 0 {
        didSet {
            stepperLabel.text = String(stepperValue)
        }
    }
    
    public var stepperTarget: Any?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(stack)
        stack.anchor(leading: leadingAnchor, trailing: trailingAnchor)
        stack.centerYToSuperView()
        incrementButton.addTarget(stepperTarget,
                                  action: #selector(incrementEvent),
                                  for: .touchUpInside)
        decrementButton.addTarget(stepperTarget,
                                  action: #selector(decrementEvent),
                                  for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func incrementEvent() {
        if stepperValue < 10 {
            stepperValue += 1
            stepperLabel.text = "\(stepperValue)"
        } else {
            print("Max Value")
        }
    }
    
    @objc private func decrementEvent() {
        if stepperValue > 0 {
            stepperValue -= 1
            stepperLabel.text = "\(stepperValue)"
        } else {
            print("Min Value")
        }
    }
}

//
//  TotalView.swift
//  FoodPoolKit
//
//  Created by Ayşenur Bakırcı on 16.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class TotalView: UIView {
    
    //MARK: - Properties
    lazy var total: UILabel = .create(
        lblText: "Total",
        font: .boldLarge,
        backgroundColor: .clear,
        textColor: .secondaryTitle,
        numberOfLines: 1,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var totalPrice: UILabel = .create(
        lblText: "00.00",
        font: .large,
        backgroundColor: .clear,
        textColor: .mainColor,
        numberOfLines: 1,
        textAlignment: .right,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [total, totalPrice],
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .fill,
        spacing: 2
    )
    
    lazy var button: Button = .init(
        type: .primary,
        title: "Continue"
    )
    
    //MARK: - Initalization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Configuration
    private func configuration() {
        addSubviews(labelStack, button)
        
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          padding: .equalPadding(10.0))
        
        button.anchor(top: labelStack.bottomAnchor,
                      leading: leadingAnchor,
                      bottom: bottomAnchor,
                      trailing: trailingAnchor)
    }
    
    //MARK: - Apply View
    public func apply(amount: Double) {
        self.totalPrice.text = "\(amount)"
    }
    
    //MARK: - Add Target To View
    public func addTarget(_ target: Any?, selector: Selector) {
        self.button.addTarget(target: target, selector: selector)
    }
}

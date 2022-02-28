//
//  WalletView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 23.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class WalletView: UIView {
    
    lazy var title: UILabelView = .create(
        lblText: "Amount:",
        font: .boldMedium,
        textColor: .mainColor,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var amount: UILabelView = .create(
        lblText: "00.00 $",
        font: .medium,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var addButton: UIButton = .create(
        type: .system,
        image: .plusFillAndCircular,
        tintColor: .mainColor,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, amount],
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .leading
    )
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubviews(labelStack, addButton)
        labelStack.anchor(leading: leadingAnchor,
                          padding: .padding(left: 10.0))
        labelStack.centerYToSuperView()
        addButton.anchor(trailing: trailingAnchor,
                         padding: .padding(right: 10.0))
        addButton.centerYToSuperView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(amount: Double,
                      buttonTarget: Any? = nil,
                      buttonSelector: Selector) {
        self.amount.text = "\(amount)"
        self.addButton.addTarget(target,
                                 action: buttonSelector,
                                 for: .touchUpInside)
    }
}

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
    
    //MARK: - Properties
    private lazy var title: UILabelView = .create(
        lblText: "Amount:",
        font: .boldMedium,
        textColor: .mainColor,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var amount: UILabelView = .create(
        lblText: "00.00 $",
        font: .medium,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var addButton: UIButton = .create(
        type: .system,
        image: .plusFillAndCircular,
        tintColor: .mainColor,
        sizeToFit: true
    )
    
    private lazy var labelStack: UIStackView = .create(
        subviews: [title, amount],
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .leading
    )
    
    //MARK: - Initalization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    private func configuration() {
        addSubviews(labelStack, addButton)
        labelStack.anchor(leading: leadingAnchor,
                          padding: .padding(left: 10.0))
        labelStack.centerYToSuperView()
        addButton.anchor(trailing: trailingAnchor,
                         padding: .padding(right: 10.0))
        addButton.centerYToSuperView()
    }
    
    //MARK: - Apply Model
    public func apply(amount: Double,
                      buttonTarget: Any? = nil,
                      buttonSelector: Selector) {
        self.amount.text = "\(amount)"
        self.addButton.addTarget(target,
                                 action: buttonSelector,
                                 for: .touchUpInside)
    }
}

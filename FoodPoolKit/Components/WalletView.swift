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
    private lazy var title: UILabel = .create(
        lblText: "Amount:",
        font: .boldMedium,
        textColor: .mainColor,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var amount: UILabel = .create(
        lblText: "00.00 $",
        font: .medium,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var addButton: Button = .init(
        type: .icon,
        image: .plusFillAndCircular
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
        
        addButton.anchor(trailing: trailingAnchor,
                         padding: .padding(right: 10.0))
        addButton.centerYToSuperView()
        
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: addButton.leadingAnchor,
                          padding: .padding(left: 10.0, right: 10.0))
    }
    
    //MARK: - Apply Model
    public func apply(amount: Double) {
        self.amount.text = "\(amount)"

    }
    
    //MARK: - Add Target
    public func addTarget(target: Any? = nil,
                          selector: Selector) {
        addButton.addTarget(target: target, selector: selector)
    }
}

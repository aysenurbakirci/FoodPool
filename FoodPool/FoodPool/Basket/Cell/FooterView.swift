//
//  FooterView.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper
import FoodPoolKit

final class FooterView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "FooterView"
    
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
    
    lazy var button: UIButton = .create(
        type: .system,
        title: "Continue",
        titleColor: .white,
        font: .medium,
        backgroundColor: .mainColor,
        sizeToFit: true,
        horizontalAlignment: .center,
        verticalAlignment: .center
    )

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(labelStack, button)
        labelStack.anchor(top: contentView.topAnchor,
                          leading: contentView.leadingAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .equalPadding(10.0))
        button.anchor(top: labelStack.bottomAnchor,
                      leading: contentView.leadingAnchor,
                      bottom: contentView.bottomAnchor,
                      trailing: contentView.trailingAnchor,
                      padding: .equalPadding(10.0))
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

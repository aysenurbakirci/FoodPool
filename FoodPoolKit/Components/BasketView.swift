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
        font: .large,
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
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .leading
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(labelStack)
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: .padding(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(title: String, price: Double, count: Double) {
        self.title.text = title
        self.price.text = "\(price) $"
    }
}

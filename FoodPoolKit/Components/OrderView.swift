//
//  OrderView.swift
//  FoodPoolKit
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class OrderView: UIView {
    
    lazy var title: UILabel = .create(
        lblText: "Restaurant",
        font: .boldLarge,
        textColor: .mainColor,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var mealList: UILabel = .create(
        lblText: "Meal List",
        font: .small,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var total: UILabel = .create(
        lblText: "00.00 $",
        font: .boldSmall,
        textColor: .secondaryColor,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, mealList],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .leading,
        spacing: 2
    )
    
    lazy var rightArrow: UIImageView = .create(
        image: .rightArrow,
        tintColor: .secondaryColor
    )
    
    lazy var totalStack: UIStackView = .create(
        subviews: [total, rightArrow],
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .trailing,
        spacing: 2
    )
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        total.addCornerRadius(radius: 8)
        
        addSubviews(labelStack, totalStack)
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          padding: .equalPadding(10.0))
        
        totalStack.anchor(trailing: trailingAnchor,
                          padding: .padding(right: 10.0))
        totalStack.centerAnchor(centerY: labelStack.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(title: String, meals: String, total: String) {
        self.title.text = title
        self.mealList.text = meals
        self.total.text = total
    }
}

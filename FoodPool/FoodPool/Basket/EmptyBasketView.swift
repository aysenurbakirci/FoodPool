//
//  EmptyBasketView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 29.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

final class EmptyBasketView: UIView {
    
    lazy var label: UILabel = .create(
        lblText: "Are you ready for order? Go! 🍔",
        font: .boldLarge,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubview(label)
        label.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

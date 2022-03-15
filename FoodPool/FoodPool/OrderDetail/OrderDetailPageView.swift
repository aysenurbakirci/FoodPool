//
//  OrderDetailPageView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 14.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import AutoLayoutHelper
import LayoutKit

class OrderDetailPageView: UIView {
    
    lazy var orderState: UILabel = .create(
        lblText: "STATUS",
        font: .boldMedium,
        textColor: .secondaryTitle,
        sizeToFit: true
    )
    
    lazy var stateImage: UIImageView = .create(
        image: .waitingOrder,
        tintColor: .mainColor,
        isOpaque: true
    )
    
    lazy var stateStack: UIStackView = .create(
        subviews: [stateImage, orderState],
        axis: .horizontal,
        distribution: .equalSpacing,
        alignment: .center,
        spacing: 6.0
    )
    
    lazy var desc: UILabel = .create(
        lblText: "Status of your order:",
        font: .medium,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var stackView: UIStackView = .create(
        subviews: [desc, stateStack],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .center,
        spacing: 4.0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.centerToSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(stateTitle: String, stateIcon: UIImage) {
        self.orderState.text = stateTitle
        self.stateImage.image = stateIcon
    }
}

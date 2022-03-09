//
//  MealView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 22.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class MealView: UIView {
    
    lazy var image: UIImageView = .create(
        image: .photo,
        contentMode: .scaleAspectFill,
        tintColor: .gray,
        isOpaque: true
    )
    
    lazy var stepper = StepperView()
    
    lazy var contentView: UIView = .create()
    
    lazy var title: UILabel = .create(
        lblText: "Title",
        font: .boldLarge,
        textColor: .title,
        numberOfLines: 1,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var price: UILabel = .create(
        lblText: "30$",
        font: .boldMedium,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, price],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .leading,
        spacing: 4
    )
    
    public lazy var stepperValue: Int = stepper.stepperValue
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        
        addSubview(contentView)
        contentView.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           padding: .init(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0))
        contentView.addBorder(color: .background, width: 4.0)
        contentView.addCornerRadius(radius: 20.0)
        contentView.backgroundColor = .white
        
        contentView.addSubviews(image, labelStack, stepper)
        
        image.anchor(top: contentView.topAnchor,
                     leading: contentView.leadingAnchor,
                     trailing: contentView.trailingAnchor)
        
        image.aspect(ratio: 1)
        
        labelStack.anchor(top: image.bottomAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          padding: .equalPadding(15.0))
        
        stepper.anchor(top: image.bottomAnchor,
                       bottom: contentView.bottomAnchor,
                       trailing: contentView.trailingAnchor,
                       padding: .equalPadding(15.0))
    }
    
    public func apply(image: UIImage? = nil, title: String, price: String) {
        if let image = image {
            self.image.image = image
        }
        self.title.text = title
        self.price.text = price
    }
    
    public func addTarget(_ target: Any?) {
        stepper.stepperTarget = target
    }
}

//
//  AddressView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 23.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class AddressView: UIView {

    lazy var title: UILabelView = .create(
        lblText: "Title",
        font: .boldLarge,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var address: UILabelView = .create(
        lblText: "Address",
        font: .small,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .left,
        sizeToFit: true
    )
    
    lazy var editButton: UIButton = .create(
        type: .system,
        image: .editFillAndCircular,
        tintColor: .mainColor,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, address],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .leading,
        spacing: 2
    )
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(labelStack, editButton)
        labelStack.anchor(leading: leadingAnchor,
                          padding: .padding(left: 10.0))
        labelStack.centerYToSuperView()
        
        editButton.anchor(trailing: trailingAnchor,
                          padding: .padding(right: 10.0))
        editButton.centerAnchor(centerY: labelStack.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(addressTitle: String,
                      address: String,
                      buttonTarget: Any? = nil,
                      buttonSelector: Selector) {
        self.title.text = addressTitle
        self.address.text = address
        self.editButton.addTarget(target,
                                 action: buttonSelector,
                                 for: .touchUpInside)
    }
}

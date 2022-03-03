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
    
    //MARK: - Properties
    private lazy var title: UILabelView = .create(
        lblText: "Title",
        font: .boldLarge,
        textColor: .secondaryTitle,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var address: UILabelView = .create(
        lblText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        font: .small,
        textColor: .mainColor,
        numberOfLines: 0,
        textAlignment: .left,
        sizeToFit: true
    )
    
    private lazy var editButton: UIButton = .create(
        type: .system,
        image: .editFillAndCircular,
        tintColor: .mainColor,
        sizeToFit: true
    )
    
    private lazy var labelStack: UIStackView = .create(
        subviews: [title, address],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .leading,
        spacing: 2
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
        addSubviews(labelStack, editButton)
        
        editButton.anchor(trailing: trailingAnchor,
                          padding: .padding(right: 10.0))
        editButton.centerAnchor(centerY: labelStack.centerYAnchor)
        
        labelStack.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: editButton.leadingAnchor,
                          padding: .padding(left: 10.0, right: 10.0))
        labelStack.centerYToSuperView()
    }
    
    //MARK: - Apply Model
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

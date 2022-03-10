//
//  Button.swift
//  FoodPoolKit
//
//  Created by Ayşe Nur Bakırcı on 6.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class Button: UIView {
    
    private var buttonType: ButtonType!
    private var title: String!
    private var image: UIImage?
    
    private lazy var button: UIButton = .create(
        type: .system,
        title: title,
        image: image,
        titleColor: buttonType.appearance.titleColor,
        tintColor: buttonType.appearance.imageColor,
        font: buttonType.appearance.font,
        backgroundColor: buttonType.appearance.backgroundColor,
        sizeToFit: true,
        horizontalAlignment: buttonType.appearance.horizontalAlignment,
        verticalAlignment: buttonType.appearance.verticalAlignment
    )
    
    public init(type: ButtonType, title: String = "", image: UIImage? = nil) {
        super.init(frame: .zero)
        
        self.buttonType = type
        self.image = image
        self.title = title
        
        button.addCornerRadius(radius: buttonType.appearance.cornerRadius)
        button.addBorder(color: buttonType.appearance.borderColor,
                         width: buttonType.appearance.borderWidth)
        
        addSubview(button)
        button.anchor(leading: leadingAnchor,
                      trailing: trailingAnchor,
                      padding: .equalPadding(10.0))
        button.sizeAnchor(height: 35.0)
        button.centerYToSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addTarget(target: Any?, selector: Selector) {
        button.addTarget(target, action: selector, for: .touchUpInside)
    }
    
}

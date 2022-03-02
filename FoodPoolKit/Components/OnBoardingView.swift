//
//  OnBoardingView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 22.02.2022.
//

import Foundation
import LayoutKit
import AutoLayoutHelper
import UIKit

public final class OnBoardingView: UIView {
    
    //MARK: - Properties
    lazy var imageContainer: UIView = .create()
    
    lazy var image: UIImageView = .create(
        image: .plus,
        contentMode: .scaleAspectFit,
        backgroundColor: .clear,
        tintColor: .white,
        isOpaque: true
    )
    
    lazy var title: UILabelView = .create(
        lblText: "Title",
        font: .boldLarge,
        textColor: .title,
        numberOfLines: 1,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var desc: UILabelView = .create(
        lblText: "Description",
        font: .xSmall,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var labelStack: UIStackView = .create(
        subviews: [title, desc],
        axis: .vertical,
        distribution: .equalSpacing,
        alignment: .center,
        spacing: 4
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
        addSubviews(imageContainer, labelStack)
        imageContainer.addSubview(image)
        
        imageContainer.backgroundColor = .secondaryColor
        
        imageContainer.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor)
        imageContainer.heightAnchor.constraint(equalTo: heightAnchor,
                                               multiplier: 0.5).isActive = true

        image.anchor(top: imageContainer.topAnchor,
                     bottom: imageContainer.bottomAnchor,
                     padding: .padding(top: 20.0))
        image.centerXToSuperView()
        image.aspect(ratio: 1)
        
        labelStack.anchor(top: imageContainer.bottomAnchor,
                          leading: safeAreaLeftAnchor,
                          trailing: safeAreaRightAnchor,
                          padding: .equalPadding(20.0))
    }
    
    //MARK: - Apply Model
    public func apply(image: UIImage?, title: String, subtitle: String?) {
        if let image = image {
            self.image.image = image
        }
        self.title.text = title
        self.desc.text = subtitle ?? ""
    }
    
}

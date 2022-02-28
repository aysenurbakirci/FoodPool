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
    
    lazy var image: UIImageView = .create(
        image: UIImage(systemName: "photo")!,
        contentMode: .scaleAspectFit,
        backgroundColor: .clear,
        tintColor: .gray,
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
        spacing: 2
    )

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(image, labelStack)
        image.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     trailing: trailingAnchor)
        image.viewAspect(ratio: 1)
        labelStack.anchor(top: image.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          padding: .equalPadding(10.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func apply(image: UIImage?, title: String, subtitle: String?) {
        if let image = image {
            self.image.image = image
        }
        self.title.text = title
        self.desc.text = subtitle ?? ""
    }
    
}

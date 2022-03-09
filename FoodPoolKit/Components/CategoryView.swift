//
//  CategoryView.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 22.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class CategoryView: UIView {
    
    lazy var image: UIImageView = .create(
        image: .photo,
        contentMode: .scaleAspectFill,
        backgroundColor: .clear,
        tintColor: .gray,
        isOpaque: true
    )
    
    lazy var title: UILabel = .create(
        lblText: "Title",
        font: .boldSmall,
        backgroundColor: .mainColor,
        textColor: .white,
        numberOfLines: 1,
        textAlignment: .center,
        sizeToFit: true
    )
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        addSubviews(image, title)
        image.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     trailing: trailingAnchor)
        image.aspect(ratio: 1.2)
        title.equalWidth(to: image)
        title.anchor(top: image.bottomAnchor,
                     bottom: bottomAnchor)
        addCornerRadius(radius: 8.0)
    }
    
    public func apply(image: UIImage? = nil, title: String) {
        if let image = image {
            self.image.image = image
        }
        self.title.text = title
    }
}

//
//  RestaurantViewHorizontal.swift
//  FoodPoolUIKit
//
//  Created by Ayşe Nur Bakırcı on 22.02.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper

public final class RestaurantView: UIView {
    
    lazy var contentView: UIView = .create()
    
    lazy var image: UIImageView = .create(
        image: .photo,
        contentMode: .scaleAspectFit,
        backgroundColor: .clear,
        tintColor: .gray,
        isOpaque: true
    )
    
    lazy var title: UILabel = .create(
        lblText: "Title",
        font: .boldXLarge,
        textColor: .mainColor,
        numberOfLines: 1,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var desc: UILabel = .create(
        lblText: "Description",
        font: .medium,
        textColor: .secondaryTitle,
        numberOfLines: 0,
        textAlignment: .center,
        sizeToFit: true
    )
    
    lazy var isOpenRestaurant: UILabel = .create(
        lblText: "Open",
        font: .boldMedium,
        backgroundColor: .mainColor,
        textColor: .white,
        numberOfLines: 1,
        textAlignment: .center
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
        
        contentView.addSubviews(image, labelStack, isOpenRestaurant)
        
        image.anchor(top: contentView.topAnchor,
                     leading: contentView.leadingAnchor,
                     trailing: contentView.trailingAnchor,
                     padding: .padding(top: 10.0))
        
        image.aspect(ratio: 1.5)
        
        labelStack.anchor(top: image.bottomAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .equalPadding(10.0))
        
        isOpenRestaurant.anchor(top: contentView.topAnchor,
                                trailing: contentView.trailingAnchor,
                                padding: .equalPadding(10.0))
        isOpenRestaurant.addCornerRadius(radius: 4.0)
    }
    
    public func apply(image: UIImage? = nil, title: String, description: String, isOpen: Bool? = nil) {
        if let image = image {
            self.image.image = image
        }
        self.title.text = title
        self.desc.text = description
        
        guard let isOpen = isOpen else {
            isOpenRestaurant.isHidden = true
            return
        }
        
        if !isOpen {
            isOpenRestaurant.text = "Closed"
            isOpenRestaurant.backgroundColor = .secondaryTitle
            self.title.textColor = .secondaryTitle
        }
    }
}

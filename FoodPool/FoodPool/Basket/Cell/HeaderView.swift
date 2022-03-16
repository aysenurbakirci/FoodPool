//
//  HeaderView.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import AutoLayoutHelper
import FoodPoolKit

final class HeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Properties
    static let reuseIdentifier = "HeaderView"
    
    //MARK: - UI Properties
    lazy var restaurantImage: UIImageView = .create(image: .photo)
    
    lazy var title: UILabel = .create(
        lblText: "Restaurant Name",
        font: .boldLarge,
        textColor: .title,
        numberOfLines: 0,
        textAlignment: .left,
        sizeToFit: true
    )
    
    //MARK: - Initalization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(restaurantImage, title)
        contentView.backgroundColor = .white
        contentView.addCornerRadius(radius: 20.0)
        
        restaurantImage.anchor(top: contentView.topAnchor,
                               leading: contentView.leadingAnchor,
                               bottom: contentView.bottomAnchor,
                               padding: .equalPadding(10.0))
        restaurantImage.sizeAnchor(height: 60.0)
        restaurantImage.aspect(ratio: 1)
        
        title.anchor(top: contentView.topAnchor,
                     leading: restaurantImage.trailingAnchor,
                     bottom: contentView.bottomAnchor,
                     trailing: contentView.trailingAnchor,
                     padding: .equalPadding(10.0))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply Model
    func apply(imageName: String, restaurant: String) {
        let image = UIImage(named: imageName)
        self.restaurantImage.image = image
        self.title.text = restaurant
    }
}

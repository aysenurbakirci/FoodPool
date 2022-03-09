//
//  CuisineViewCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import FoodPoolKit

final class CuisineViewCell: UICollectionViewCell {
    
    lazy var categoryView = CategoryView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryView)
        categoryView.addCornerRadius(radius: 10.0)
        categoryView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(imageName: String, title: String) {
        let image = UIImage(named: imageName)
        categoryView.apply(image: image, title: title)
    }
}

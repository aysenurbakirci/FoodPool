//
//  RestaurantCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class RestaurantCell: UITableViewCell {
    
    lazy var restaurantView = RestaurantView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(restaurantView)
        restaurantView.fillSuperView()
        contentView.backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(imageName: String, title: String, description: String, isOpen: Bool? = nil) {
        let image = UIImage(named: imageName)
        restaurantView.apply(image: image, title: title, description: description, isOpen: isOpen)
    }
}

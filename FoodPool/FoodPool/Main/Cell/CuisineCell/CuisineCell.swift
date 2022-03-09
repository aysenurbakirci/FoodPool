//
//  CuisineCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import AutoLayoutHelper
import FoodPoolAPI

final class CuisineCell: UITableViewCell {
    
    lazy var cuisineView = CuisineView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cuisineView)
        cuisineView.fillSuperView()
        contentView.backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(cuisineList: [Cuisine]) {
        cuisineView.cuisineList = cuisineList
    }
}

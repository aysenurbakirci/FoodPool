//
//  MealCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import FoodPoolAPI

final class MealCell: UITableViewCell {
    
    //MARK: - Properties
    lazy var mealView = MealView()
    
    //MARK: - Initalization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mealView)
        mealView.fillSuperView()
        contentView.backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply Cell
    func apply(model: MenuModel) {
        let image = UIImage(named: model.imageName)
        mealView.apply(image: image, title: model.name, price: String(model.price))
    }
    
    //MARK: - Add Target To Cell
    func addTarget(_ target: Any?, selector: Selector) {
        mealView.addTarget(target: target, selector: selector)
    }
}

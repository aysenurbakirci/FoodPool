//
//  MealCell.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class MealCell: UITableViewCell {
    
    //MARK: - Properties
    lazy var mealView = MealView()
    lazy var stepperValue: Int = mealView.stepperValue
    
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
    func apply(imageName: String, title: String, price: String) {
        let image = UIImage(named: imageName)
        mealView.apply(image: image, title: title, price: price)
    }
    
    //MARK: - Add Target To Cell
    func addTarget(_ target: Any?) {
        mealView.addTarget(target)
    }
    
}

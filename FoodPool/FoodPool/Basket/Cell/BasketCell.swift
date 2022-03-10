//
//  BasketCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

final class BasketCell: UITableViewCell {
    
    lazy var basketView = BasketView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(basketView)
        basketView.fillSuperView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(title: String, price: Double, count: Double) {
        basketView.apply(title: title, price: price, count: count)
    }
    
    func addTarget(_ target: Any?) {
        basketView.addTarget(target)
    }
}

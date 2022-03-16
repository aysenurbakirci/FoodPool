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
    
    //MARK: - Properties
    lazy var basketView = BasketView()
    
    //MARK: - Initalization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(basketView)
        basketView.fillSuperView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Apply Cell
    func apply(title: String, price: Double, count: Double) {
        basketView.apply(title: title, price: price, count: count)
    }
}

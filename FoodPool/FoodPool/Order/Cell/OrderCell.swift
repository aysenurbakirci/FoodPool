//
//  OrderCell.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import AutoLayoutHelper
import LayoutKit

final class OrderCell: UITableViewCell {
    
    private lazy var orderView = OrderView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(orderView)
        orderView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(title: String, meals: [String], total: Double) {
        var string = ""
        for meal in meals {
            string += "\(meal),"
        }
        
        orderView.apply(title: title, meals: string, total:"\(total) $")
    }
}

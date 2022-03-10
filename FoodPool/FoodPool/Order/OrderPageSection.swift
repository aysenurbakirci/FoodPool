//
//  OrderPageSection.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI

enum OrderPageSection {
    case current([Order])
    case previous([Order])
}

extension OrderPageSection {
    
    var numberRowsInSection: Int {
        switch self {
        case .current(let orderList):
            return orderList.count
        case .previous(let orderList):
            return orderList.count
        }
    }
    
    var titleInSection: String {
        switch self {
        case .current(_):
            return "Current Orders"
        case .previous(_):
            return "Previous Orders"
        }
    }
}

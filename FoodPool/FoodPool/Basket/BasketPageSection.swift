//
//  BasketPageSection.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import FoodPoolAPI

enum BasketPageSection {
    case restaurant(String)
    case mealList([BasketModel])
}

extension BasketPageSection {
    var numberRowsInSection: Int {
        switch self {
        case .restaurant(_):
            return 1
        case .mealList(let mealList):
            return mealList.count
        }
    }
}

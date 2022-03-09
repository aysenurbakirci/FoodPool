//
//  DetailPageSection.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import FoodPoolAPI

enum DetailPageSection {
    case restaurant(Restaurant)
    case mealList([MenuModel])
    case drinkList([MenuModel])
}

extension DetailPageSection {
    var numberRowsInSection: Int {
        switch self {
        case .restaurant(_):
            return 1
        case .mealList(let mealList):
            return mealList.count
        case .drinkList(let drinkList):
            return drinkList.count
        }
    }
    
    var titleInSection: String? {
        switch self {
        case .restaurant(_):
            return nil
        case .mealList(_):
            return "Meals"
        case .drinkList(_):
            return "Drinks"
        }
    }
}

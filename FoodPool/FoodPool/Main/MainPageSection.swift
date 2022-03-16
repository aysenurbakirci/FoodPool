//
//  MainPageSection.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation
import FoodPoolAPI

//MARK: - Page Section
enum MainPageSection {
    case category([Cuisine])
    case restaurant([Restaurant])
}

//MARK: - Section Helper Properties
extension MainPageSection {
    
    var numberRowsInSection: Int {
        switch self {
        case .category:
            return 1
        case .restaurant(let restaurantArray):
            return restaurantArray.count
        }
    }
    
    var titleInSection: String {
        switch self {
        case .category(_):
            return "Categories"
        case .restaurant(_):
            return "Restaurants"
        }
    }
}

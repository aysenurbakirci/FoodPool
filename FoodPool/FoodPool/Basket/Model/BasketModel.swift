//
//  BasketModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation

struct BasketModel {
    var restaurantName: String
    var restaurantImage: String
    var mealList: [BasketMealModel]
}

struct BasketMealModel {
    var count: Int
    var mealName: String
    var price: Double
}

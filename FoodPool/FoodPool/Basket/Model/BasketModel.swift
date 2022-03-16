//
//  BasketModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation

struct BasketMealModel {
    var count: Int
    var mealName: String
    var price: Double
}

struct RestaurantModel {
    var restaurantName: String
    var restaurantImage: String
}

struct BasketModel {
    var restaurant: RestaurantModel
    var mealList: [BasketMealModel]
}

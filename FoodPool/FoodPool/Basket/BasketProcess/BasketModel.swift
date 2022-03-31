//
//  BasketModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 29.03.2022.
//

import Foundation

struct BasketMealModel {
    var count: Int
    var mealName: String
    var price: Double
}

struct RestaurantModel {
    var restaurantId: Int
    var restaurantName: String
    var restaurantImage: String
}

struct BasketModel {
    var restaurant: RestaurantModel
    var mealList: [BasketMealModel]
}

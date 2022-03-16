//
//  Order.swift
//  FoodPoolAPI
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation

public struct Order: Decodable {
    public var id: Int
    public var userID: String
    public var state: String
    public var restaurantName: String
    public var price: Double
    public var mealList: [String]
}

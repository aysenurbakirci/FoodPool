//
//  Restaurant.swift
//  FoodPoolAPI
//
//  Created by Ayşe Nur Bakırcı on 7.03.2022.
//

import Foundation

public struct RestaurantModel: Decodable {
    public var restaurant: [Restaurant]
}

public struct Restaurant: Decodable {
    public var id: String
    public var name: String
    public var imageName: String
    public var address: String
    public var cuisine: String
    public var isOpen: Bool
    public var mealList: [MenuModel]
    public var drinkList: [MenuModel]
}

public struct MenuModel: Decodable {
    public var imageName: String
    public var name: String
    public var price: Float
}

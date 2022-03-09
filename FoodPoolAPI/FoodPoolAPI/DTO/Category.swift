//
//  Category.swift
//  FoodPoolAPI
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation

public struct CategoryModel: Decodable {
    public var cuisine: [Cuisine]
}

public struct Cuisine: Decodable {
    public var cuisine: String
    public var image: String
}

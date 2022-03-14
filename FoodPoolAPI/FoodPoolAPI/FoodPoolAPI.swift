//
//  FoodPoolAPI.swift
//  FoodPoolAPI
//
//  Created by Ayşenur Bakırcı on 11.03.2022.
//

import Foundation

public protocol FoodPoolAPI {
    var schema: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [String: String] { get }
}

public extension FoodPoolAPI {
    var schema: String {
        return "http://"
    }
    
    var host: String {
        return "localhost:3000"
    }
}

public enum FoodPoolData: FoodPoolAPI {
    case onBoarding, restaurant, cuisine
    public var path: String {
        switch self {
        case .onBoarding:
            return "/onBoarding"
        case .restaurant:
            return "/restaurant"
        case .cuisine:
            return "/cuisine"
        }
    }
    
    public var queryItems: [String : String] {
        return [:]
    }
}

public enum FoodPoolSearchedData: FoodPoolAPI {
    case user(id: Int), restaurant(id: Int), order(userID: Int)
    public var path: String {
        switch self {
        case .user(_):
            return "/user"
        case .restaurant(_):
            return "/restaurant"
        case .order(_):
            return "/orders"
        }
    }
    
    public var queryItems: [String : String] {
        switch self {
        case .user(let id):
            return ["id":"\(id)"]
        case .restaurant(let id):
            return ["id":"\(id)"]
        case .order(let id):
            return ["userID":"\(id)"]
        }
    }
}

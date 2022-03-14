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
    case user(id: Int), restaurant(id: Int), currentOrder(userID: Int), deliveredOrder(userID: Int)
    public var path: String {
        switch self {
        case .user(_):
            return "/user"
        case .restaurant(_):
            return "/restaurant"
        case .currentOrder(_):
            return "/currentOrders"
        case .deliveredOrder(_):
            return "/deliveredOrders"
        }
    }
    
    public var queryItems: [String : String] {
        switch self {
        case .user(let id):
            return ["id":"\(id)"]
        case .restaurant(let id):
            return ["id":"\(id)"]
        case .currentOrder(userID: let userID):
            return ["userID":"\(userID)"]
        case .deliveredOrder(userID: let userID):
            return ["userID":"\(userID)"]
        }
    }
}

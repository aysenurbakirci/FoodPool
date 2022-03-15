//
//  OrderStates.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit

enum OrderState {
    case waiting
    case preparing
    case ready
    case ontheway
    case delivered
}

extension OrderState {
    var rawValue: Double {
        switch self {
        case .waiting:
            return 0.0
        case .preparing:
            return 0.2
        case .ready:
            return 0.4
        case .ontheway:
            return 0.6
        case .delivered:
            return 0.8
        }
    }
    
    var title: String {
        switch self {
        case .waiting:
            return "PENDING"
        case .preparing:
            return "PREPARING"
        case .ready:
            return "READY"
        case .ontheway:
            return "ON THE WAY"
        case .delivered:
            return "DELIVERED"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .waiting:
            return .waitingOrder
        case .preparing:
            return .preparingOrder
        case .ready:
            return .readyOrder
        case .ontheway:
            return .onTheWayOrder
        case .delivered:
            return .deliveredOrder
        }
    }
}

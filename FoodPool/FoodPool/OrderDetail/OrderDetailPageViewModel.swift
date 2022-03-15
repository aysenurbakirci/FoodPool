//
//  OrderDetailPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import FoodPoolAPI

protocol OrderDetailPageViewModelProtocol {
    var orderState: OrderState { get }
}

final class OrderDetailPageViewModel: OrderDetailPageViewModelProtocol {
    
    private var order: Order?
    
    init(order: Order) {
        self.order = order
    }
    
    var orderState: OrderState {
        if order?.state == "waiting" {
            return OrderState.waiting
        } else if order?.state == "preparing" {
            return OrderState.preparing
        } else if order?.state == "ready" {
            return OrderState.ready
        } else if order?.state == "onTheWay" {
            return OrderState.ontheway
        } else {
            return OrderState.delivered
        }
    }
    
}

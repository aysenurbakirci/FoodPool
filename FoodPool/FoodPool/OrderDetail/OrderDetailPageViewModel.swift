//
//  OrderDetailPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import FoodPoolAPI

//MARK: - Protocol
protocol OrderDetailPageViewModelProtocol {
    var orderState: OrderState { get }
}

final class OrderDetailPageViewModel: OrderDetailPageViewModelProtocol {
    
    //MARK: - Properties
    private var order: Order?
    
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
    
    //MARK: - Initalization
    init(order: Order) {
        self.order = order
    }
}

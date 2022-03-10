//
//  OrderPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI

protocol OrderPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> OrderPageSection
    func titleForHeaderInSection(for section: Int) -> String
}

final class OrderPageViewModel: OrderPageViewModelProtocol {
    
    private var orderList: [OrderPageSection] = []
    private var api: BundleAPIProtocol!
    
    init(api: BundleAPIProtocol) {
        self.api = api
    }
    
    func loadData() {
        var deliveredOrders: [Order] = []
        var currentOrders: [Order] = []
        
        let orders = api.getData(with: OrderModel.self)
        
        for order in orders.orders {
            if order.state == "delivered" {
                deliveredOrders.append(order)
            } else {
                currentOrders.append(order)
            }
        }
        
        orderList = [.current(currentOrders),
                    .previous(deliveredOrders)]
    }
    
    func numberOfSections() -> Int {
        return orderList.count
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return orderList[section].numberRowsInSection
    }
    
    func modelForSection(at index: IndexPath) -> OrderPageSection {
        return orderList[index.section]
    }
    
    func titleForHeaderInSection(for section: Int) -> String {
        return orderList[section].titleInSection
    }
}

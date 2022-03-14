//
//  OrderPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift

protocol OrderPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> OrderPageSection
    func titleForHeaderInSection(for section: Int) -> String
    var delegate: OrderPageViewModelDelegate? { get set }
}

protocol OrderPageViewModelDelegate {
    func reloadTabelView()
}

final class OrderPageViewModel: OrderPageViewModelProtocol {
    
    var delegate: OrderPageViewModelDelegate?
    private var orderList: [OrderPageSection] = []
    private var bag = DisposeBag()
    
    func loadData() {
        
        let orders = FoodPoolService.getOrders(userID: 1)
        
        orders.subscribe(onNext: { [weak self] orderList in
            guard let self = self else { return }
            
            var deliveredOrders: [Order] = []
            var currentOrders: [Order] = []
            
            for order in orderList {
                if order.state == "delivered" {
                    deliveredOrders.append(order)
                } else {
                    currentOrders.append(order)
                }
            }
            self.orderList = [.current(currentOrders),
                        .previous(deliveredOrders)]
            self.delegate?.reloadTabelView()
            
        }).disposed(by: bag)
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

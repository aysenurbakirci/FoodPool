//
//  OrderPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift

protocol OrderPageViewModelDelegate {
    func reloadTableView()
}

protocol OrderPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> OrderPageSection
    func titleForHeaderInSection(for section: Int) -> String
    var delegate: OrderPageViewModelDelegate? { get set }
}

final class OrderPageViewModel: OrderPageViewModelProtocol {
    
    var delegate: OrderPageViewModelDelegate?
    private var orderList: [OrderPageSection] = []
    private var bag = DisposeBag()
    
    func loadData() {
        let currentOrder = FoodPoolService.getCurrentOrders(userID: 1)
        let deliveredOrder = FoodPoolService.getDeliveredOrders(userID: 1)
        
        Observable.zip(currentOrder, deliveredOrder)
            .subscribe(onNext: { [weak self] currentOrder, deliveredOrder in
                guard let self = self else { return }
                self.orderList = [.current(currentOrder), .previous(deliveredOrder)]
                print(currentOrder)
                print(deliveredOrder)
                self.delegate?.reloadTableView()
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

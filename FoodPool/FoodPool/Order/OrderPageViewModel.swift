//
//  OrderPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift
import RxCocoa

//MARK: - Delegate
protocol OrderPageViewModelDelegate {
    func reloadTableView()
}

//MARK: - Protocol
protocol OrderPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> OrderPageSection
    func titleForHeaderInSection(for section: Int) -> String
    var delegate: OrderPageViewModelDelegate? { get set }
}

final class OrderPageViewModel: OrderPageViewModelProtocol, ActivityHandler {
    
    //MARK: - ActivityHandler Properties
    var isLoading = BehaviorRelay<Bool>(value: false)
    var onError = BehaviorRelay<Error?>(value: nil)
    private var bag = DisposeBag()
    
    //MARK: - Properties
    var delegate: OrderPageViewModelDelegate?
    private var orderList: [OrderPageSection] = []
    
    //MARK: - Load Method
    func loadData() {
        isLoading.accept(true)
        
        let currentOrder = FoodPoolService.getCurrentOrders(userID: 1)
        let deliveredOrder = FoodPoolService.getDeliveredOrders(userID: 1)
        
        Observable
            .zip(currentOrder, deliveredOrder)
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                self?.isLoading.accept(false)
            })
            .subscribe(onNext: { [weak self] currentOrder, deliveredOrder in
                guard let self = self else { return }
                self.orderList = [.current(currentOrder),
                                  .previous(deliveredOrder)]
                self.delegate?.reloadTableView()
            }, onError: { [weak self] error in
                self?.onError.accept(error)
            })
            .disposed(by: bag)
    }
    
    //MARK: - Helper Methods
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

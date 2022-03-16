//
//  MainPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift
import RxCocoa

//MARK: - Delegate
protocol MainPageViewModelDelegate {
    func reloadTableView()
}

//MARK: - Protocol
protocol MainPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> MainPageSection
    func restaurantModelInSection(at index: IndexPath) -> Restaurant?
    func titleForHeaderInSection(for section: Int) -> String
    var delegate: MainPageViewModelDelegate? { get set }
}

final class MainPageViewModel: MainPageViewModelProtocol, ActivityHandler {
    
    //MARK: - Activity Handler Properties
    var isLoading = BehaviorRelay<Bool>(value: false)
    var onError = BehaviorRelay<Error?>(value: nil)
    
    //MARK: - Properties
    var delegate: MainPageViewModelDelegate?
    private var mainPage: [MainPageSection] = []
    private var bag = DisposeBag()
    
    //MARK: - Load Data
    func loadData() {
        isLoading.accept(true)
        
        let restaurants = FoodPoolService.getRestaurans()
        let categories = FoodPoolService.getCategories()
        
        Observable
            .zip(restaurants, categories)
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                self?.isLoading.accept(false)
            })
            .subscribe(onNext: { [weak self] restaurants, categories in
                guard let self = self else { return }
                self.mainPage = [.category(categories),
                            .restaurant(restaurants)]
                self.delegate?.reloadTableView()
                
            }, onError: { [weak self] error in
                self?.onError.accept(error)
            })
            .disposed(by: bag)
    }
    
    //MARK: - Helper Methods
    func numberOfSections() -> Int {
        return mainPage.count
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return mainPage[section].numberRowsInSection
    }
    
    func modelForSection(at index: IndexPath) -> MainPageSection {
        return mainPage[index.section]
    }
    
    func titleForHeaderInSection(for section: Int) -> String {
        return mainPage[section].titleInSection
    }
    
    func restaurantModelInSection(at index: IndexPath) -> Restaurant? {
        let selectedSection = mainPage[index.section]
        switch selectedSection {
        case .category(_):
            return nil
        case .restaurant(let restaurantList):
            let restaurant = restaurantList[index.row]
            if restaurant.isOpen {
                return restaurant
            }
            return nil
        }
    }
    
}

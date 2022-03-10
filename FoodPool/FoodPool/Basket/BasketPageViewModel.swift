//
//  BasketPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI

protocol BasketPageViewModelProtocol {
    func deleteItem(at indexPath: IndexPath)
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(in section: Int) -> BasketPageSection
}

final class BasketPageViewModel: BasketPageViewModelProtocol {
    
    private var mealList: [BasketPageSection]
    private var basketList: [BasketModel]
    
    init() {
        let meal1 = BasketModel(count: 2, mealName: "meal1", price: 10.0)
        let meal2 = BasketModel(count: 1, mealName: "meal2", price: 8.0)
        let meal3 = BasketModel(count: 1, mealName: "meal3", price: 25.0)
        let meal4 = BasketModel(count: 2, mealName: "meal4", price: 12.0)
        let meal5 = BasketModel(count: 3, mealName: "meal5", price: 30.0)
        
        basketList = [meal1, meal2, meal3, meal4, meal5]
        mealList = [.restaurant("Restaurant Name"), .mealList(basketList)]
    }

    
    func deleteItem(at indexPath: IndexPath) {
        basketList.remove(at: indexPath.row)
        mealList = [.restaurant("Restaurant Name"), .mealList(basketList)]
    }
    
    func numberOfSections() -> Int {
        return mealList.count
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return mealList[section].numberRowsInSection
    }
    
    func modelForSection(in section: Int) -> BasketPageSection {
        return mealList[section]
    }
}

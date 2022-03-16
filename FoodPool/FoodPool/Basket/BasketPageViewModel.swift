//
//  BasketPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI

//MARK: - Protocol
protocol BasketPageViewModelProtocol {
    var deleteSection: Bool { get }
    func deleteItem(at index: IndexPath)
    func numberOfSections() -> Int
    func numberOfRowsInSection(in section: Int) -> Int
    func headerModel(in section: Int) -> RestaurantModel
    func mealListInSection(at index: IndexPath) -> BasketMealModel
}

final class BasketPageViewModel: BasketPageViewModelProtocol {
    
    //MARK: - Properties
    private var basketList: [BasketModel]
    var deleteSection: Bool = false
    
    //MARK: - Initalization
    init() {
        let meal1 = BasketMealModel(count: 2, mealName: "meal1", price: 10.0)
        let meal2 = BasketMealModel(count: 1, mealName: "meal2", price: 8.0)
        let meal3 = BasketMealModel(count: 1, mealName: "meal3", price: 25.0)
        let meal4 = BasketMealModel(count: 2, mealName: "meal4", price: 12.0)
        let meal5 = BasketMealModel(count: 3, mealName: "meal5", price: 30.0)
        let restaurant1 = RestaurantModel(restaurantName: "Restaurant1", restaurantImage: "robertas")
        let restaurant2 = RestaurantModel(restaurantName: "Restaurant2", restaurantImage: "emily")
        
        basketList = [BasketModel(restaurant: restaurant1, mealList: [meal1, meal2]),
                      BasketModel(restaurant: restaurant2, mealList: [meal3, meal4, meal5])]
    }
    
    //MARK: - Helper Methods
    func deleteItem(at index: IndexPath) {
        deleteSection = false
        if basketList[index.section].mealList.count == 1 {
            deleteSection = true
            basketList.remove(at: index.section)
        } else {
            basketList[index.section].mealList.remove(at: index.row)
        }
    }
    
    func numberOfSections() -> Int {
        return basketList.count
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return basketList[section].mealList.count
    }
    
    func headerModel(in section: Int) -> RestaurantModel {
        return basketList[section].restaurant
    }
    
    func mealListInSection(at index: IndexPath) -> BasketMealModel {
        return basketList[index.section].mealList[index.row]
    }
}

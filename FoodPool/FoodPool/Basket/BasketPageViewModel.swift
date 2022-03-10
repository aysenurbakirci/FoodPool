//
//  BasketPageViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 9.03.2022.
//

import Foundation
import FoodPoolAPI

protocol BasketPageViewModelProtocol {
}

final class BasketPageViewModel: BasketPageViewModelProtocol {
    
    private var basketList: [BasketMealModel]
    
    init() {
        let meal1 = BasketMealModel(count: 2, mealName: "meal1", price: 10.0)
        let meal2 = BasketMealModel(count: 1, mealName: "meal2", price: 8.0)
        let meal3 = BasketMealModel(count: 1, mealName: "meal3", price: 25.0)
        let meal4 = BasketMealModel(count: 2, mealName: "meal4", price: 12.0)
        let meal5 = BasketMealModel(count: 3, mealName: "meal5", price: 30.0)
        
        basketList = [meal1, meal2, meal3, meal4, meal5]
    }
}

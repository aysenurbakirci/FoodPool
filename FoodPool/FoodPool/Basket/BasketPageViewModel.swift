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
    var basketIsEmpty: Bool { get }
    func deleteItem(at index: IndexPath)
    func numberOfSections() -> Int
    func numberOfRowsInSection(in section: Int) -> Int
    func headerModel(in section: Int) -> RestaurantModel
    func mealListInSection(at index: IndexPath) -> BasketMealModel
    func calcTotal() -> Double
}

final class BasketPageViewModel: BasketPageViewModelProtocol {
    
    //MARK: - Properties
    private var basketModel = BasketProcess.shared
    
    var basketIsEmpty: Bool {
        return basketModel.basketIsEmpty
    }
    
    //MARK: - Helper Methods
    func deleteItem(at index: IndexPath) {
        basketModel.deleteItem(at: index)
    }
    
    func numberOfSections() -> Int {
        return basketModel.restaurantCount()
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return basketModel.mealCountInRestaurant(in: section)
    }
    
    func headerModel(in section: Int) -> RestaurantModel {
        return basketModel.restaurantInSection(in: section)
    }
    
    func mealListInSection(at index: IndexPath) -> BasketMealModel {
        return basketModel.mealListInRestaurant(at: index)
    }
    
    func calcTotal() -> Double {
        return basketModel.calcTotalAmount()
    }
}

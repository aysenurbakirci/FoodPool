//
//  BasketProcess.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 29.03.2022.
//

import Foundation

final class BasketProcess {
    
    static let shared = BasketProcess()
    private var basketList: [BasketModel] = []
    
    var basketIsEmpty: Bool {
        return basketList.isEmpty
    }
    
    func addNewItem(restaurant: RestaurantModel, meal: BasketMealModel) {
        var restaurantIndex: Int? = nil
        
        guard !basketList.isEmpty else {
            addNewRestaurant(restaurant: restaurant, meal: meal)
            return
        }
        
        for (index, basketModel) in basketList.enumerated() {
            if basketModel.restaurant.restaurantId == restaurant.restaurantId {
                restaurantIndex = index
            }
        }
        
        guard let restaurantIndex = restaurantIndex else {
            addNewRestaurant(restaurant: restaurant, meal: meal)
            return
        }
        addNewMeal(at: restaurantIndex, meal: meal)
    }
    
    func deleteItem(at indexPath: IndexPath) -> Bool {
        if basketList[indexPath.section].mealList.count < 2 {
            basketList.remove(at: indexPath.section)
            return true
        } else {
            basketList[indexPath.section].mealList.remove(at: indexPath.row)
            return false
        }
    }
    
    func restaurantCount() -> Int {
        return basketList.count
    }
    
    func mealCountInRestaurant(in section: Int) -> Int {
        return basketList[section].mealList.count
    }
    
    func restaurantInSection(in section: Int) -> RestaurantModel {
        return basketList[section].restaurant
    }
    
    func mealListInRestaurant(at indexPath: IndexPath) -> BasketMealModel {
        return basketList[indexPath.section].mealList[indexPath.row]
    }
    
    func calcTotalAmount() -> Double {
        var total: Double = 0.0
        for basket in basketList {
            for list in basket.mealList {
                total += list.price
            }
        }
        return total
    }
}

private extension BasketProcess {
    
    func addNewRestaurant(restaurant: RestaurantModel, meal: BasketMealModel) {
        let basketModel = BasketModel(restaurant: restaurant, mealList: [meal])
        basketList.append(basketModel)
    }
    
    func addNewMeal(at index: Int, meal: BasketMealModel) {
        basketList[index].mealList.append(meal)
    }
}

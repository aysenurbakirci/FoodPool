//
//  DetailPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import FoodPoolAPI

//MARK: - Protocol
protocol DetailPageViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func titleForHeaderInSection(for section: Int) -> String?
    func modelForSection(at index: IndexPath) -> DetailPageSection
    func addBasket(at index: IndexPath)
}

final class DetailPageViewModel: DetailPageViewModelProtocol {
    
    //MARK: - Properties
    private let restaurantModel: [DetailPageSection]!
    private let restaurant: Restaurant
    
    //MARK: - Initalization
    init(model: Restaurant) {
        self.restaurantModel = [.restaurant(model),
                                .mealList(model.mealList),
                                .drinkList(model.drinkList)]
        self.restaurant = model
    }
    
    //MARK: - Helper Methods
    func numberOfSections() -> Int {
        return restaurantModel.count
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return restaurantModel[section].numberRowsInSection
    }
    
    func titleForHeaderInSection(for section: Int) -> String? {
        return restaurantModel[section].titleInSection
    }
    
    func modelForSection(at index: IndexPath) -> DetailPageSection {
        return restaurantModel[index.section]
    }
    
    func addBasket(at index: IndexPath) {
        let basket = BasketProcess.shared
        let selectedRestaurant = RestaurantModel(restaurantId: Int(restaurant.id) ?? 0, restaurantName: restaurant.name, restaurantImage: restaurant.imageName)
        let mealModel = restaurantModel[index.section]
        
        switch mealModel {
        case .restaurant(_):
            break
        case .mealList(let meals):
            let meal = meals[index.row]
            let mealModel = BasketMealModel(count: 1, mealName: meal.name, price: meal.price)
            basket.addNewItem(restaurant: selectedRestaurant, meal: mealModel)
        case .drinkList(let drinks):
            let drink = drinks[index.row]
            let drinkModel = BasketMealModel(count: 1, mealName: drink.name, price: drink.price)
            basket.addNewItem(restaurant: selectedRestaurant, meal: drinkModel)
        }
    }
}

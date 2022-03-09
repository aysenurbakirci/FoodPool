//
//  DetailPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import FoodPoolAPI

protocol DetailPageViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func titleForHeaderInSection(for section: Int) -> String?
    func modelForSection(at index: IndexPath) -> DetailPageSection
}

final class DetailPageViewModel: DetailPageViewModelProtocol {
    
    private let restaurantModel: [DetailPageSection]!
    
    init(model: Restaurant) {
        self.restaurantModel = [.restaurant(model),
                                .mealList(model.mealList),
                                .drinkList(model.drinkList)]
    }
    
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
}

//
//  MainPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import FoodPoolAPI

protocol MainPageViewModelProtocol {
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func modelForSection(at index: IndexPath) -> MainPageSection
    func restaurantModelInSection(at index: IndexPath) -> Restaurant?
    func titleForHeaderInSection(for section: Int) -> String
}

final class MainPageViewModel: MainPageViewModelProtocol {
    
    private var mainPage: [MainPageSection] = []
    private var api: BundleAPIProtocol!
    
    init(api: BundleAPIProtocol) {
        self.api = api
    }
    
    func loadData() {
        let restaurants = api.getData(with: RestaurantModel.self)
        let categories = api.getData(with: CategoryModel.self)
        
        mainPage = [.category(categories.cuisine),
                    .restaurant(restaurants.restaurant)]
    }
    
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

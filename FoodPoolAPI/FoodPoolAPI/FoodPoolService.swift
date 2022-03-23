//
//  FoodPoolService.swift
//  FoodPoolAPI
//
//  Created by Ayşenur Bakırcı on 11.03.2022.
//

import Foundation
import RxSwift

public class FoodPoolService {

    private class func get<T: Decodable>(api: FoodPoolAPI) -> Observable<T> {
        var urlString: String = api.schema
        urlString += api.host
        urlString += api.path
    
        for (name, value) in api.queryItems {
            urlString += "?\(name)="
            urlString += value
        }
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        return URLSession.shared.rx.decodable(request: request, type: T.self)
    }
}

public extension FoodPoolService {
    
    class func getOnBoarding() -> Observable<[OnBoarding]> {
        let api = FoodPoolData.onBoarding
        return get(api: api)
    }
    
    class func getCategories() -> Observable<[Cuisine]> {
        let api = FoodPoolData.cuisine
        return get(api: api)
    }
    
    class func getRestaurans() -> Observable<[Restaurant]> {
        let api = FoodPoolData.restaurant
        return get(api: api)
    }
    
    class func getUser(id: Int) -> Observable<[User]> {
        let api = FoodPoolSearchedData.user(id: id)
        return get(api: api)
    }
    
    class func getCurrentOrders(userID: Int) -> Observable<[Order]> {
        let api = FoodPoolSearchedData.currentOrder(userID: userID)
        return get(api: api)
    }
    
    class func getDeliveredOrders(userID: Int) -> Observable<[Order]> {
        let api = FoodPoolSearchedData.deliveredOrder(userID: userID)
        return get(api: api)
    }
    
    class func getRestaurantDetail(id: Int) -> Observable<Restaurant > {
        let api = FoodPoolSearchedData.restaurant(id: id)
        return get(api: api)
    }
}


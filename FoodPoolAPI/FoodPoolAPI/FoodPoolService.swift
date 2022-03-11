//
//  FoodPoolService.swift
//  FoodPoolAPI
//
//  Created by Ayşenur Bakırcı on 11.03.2022.
//

import Foundation
import RxSwift

public class FoodPoolService {

    public class func call<T: Decodable>(api: FoodPoolAPI) -> Observable<T> {
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
    
    class func getOnBoarding() -> Observable<[Restaurant]> {
        let api = FoodPoolData.onBoarding
        return call(api: api)
    }
    
    class func getCategories() -> Observable<[Cuisine]> {
        let api = FoodPoolData.cuisine
        return call(api: api)
    }
    
    class func getRestaurans() -> Observable<[Restaurant]> {
        let api = FoodPoolData.restaurant
        return call(api: api)
    }
    
    class func getUser(id: Int) -> Observable<[User]> {
        let api = FoodPoolSearchedData.user(id: id)
        return call(api: api)
    }
    
    class func getOrders(userID: Int) -> Observable<[Order]> {
        let api = FoodPoolSearchedData.order(userID: userID)
        return call(api: api)
    }
    
    class func getRestaurantDetail(id: Int) -> Observable<Restaurant > {
        let api = FoodPoolSearchedData.restaurant(id: id)
        return call(api: api)
    }
}


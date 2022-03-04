//
//  BundleAPI.swift
//  FoodPoolAPI
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation

public protocol BundleAPIProtocol {
    func getData<T: Decodable>(with type: T.Type) -> T
}

public final class BundleAPI: BundleAPIProtocol {
    
    public func getData<T: Decodable>(with type: T.Type) -> T {
        let bundle = Bundle(for: Self.self)
        guard let bundleURL = bundle.url(forResource: "FoodPoolAPI", withExtension: "json") else {
            fatalError("Not find FoodPoolAPI.json")
        }
        
        guard let data = try? Data(contentsOf: bundleURL) else {
            fatalError("Create Data error")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Decode error")
        }
        return decodedData
    }
    
    public init() {
    }
}

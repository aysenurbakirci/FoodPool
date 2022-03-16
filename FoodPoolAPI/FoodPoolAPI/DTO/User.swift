//
//  User.swift
//  FoodPoolAPI
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation

public struct User: Decodable {
    public var id: String
    public var name: String
    public var surname: String
    public var email: String
    public var phone: String
    public var amount: Double
    public var addresses: [Address]
}

public struct Address: Decodable {
    public var id: String
    public var title: String
    public var address: String
}

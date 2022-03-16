//
//  ProfileSection.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import FoodPoolAPI

//MARK: - Sections
enum ProfilePageSection {
    case profile(User)
    case wallet(Double)
    case address([Address])
    case button
}

//MARK: - Section Helper Properties
extension ProfilePageSection {
    
    var numberRowsInSection: Int {
        switch self {
        case .profile(_):
            return 1
        case .wallet(_):
            return 1
        case .address(let addressArray):
            return addressArray.count
        case .button:
            return 1
        }
    }
    
    var titleInSection: String? {
        switch self {
        case .profile(_):
            return nil
        case .wallet(_):
            return "Wallet"
        case .address(_):
            return "Addresses"
        case .button:
            return nil
        }
    }
}

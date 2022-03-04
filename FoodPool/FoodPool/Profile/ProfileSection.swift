//
//  ProfileSection.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import FoodPoolAPI

enum ProfileSection {
    case profile(User)
    case wallet(Float)
    case address([Address])
}

extension ProfileSection {
    
    var numberRowsInSection: Int {
        switch self {
        case .profile(_):
            return 1
        case .wallet(_):
            return 1
        case .address(let addressArray):
            return addressArray.count
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
        }
    }
}

//
//  ProfilePageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import FoodPoolAPI

protocol ProfilePageViewModelProtocol {
    func loadData()
}

final class ProfilePageViewModel: ProfilePageViewModelProtocol {
    
    var profile: [ProfileSection] = []
    private var api: BundleAPIProtocol!
    
    init(api: BundleAPIProtocol) {
        self.api = api
    }
    
    func loadData() {
        let data = api.getData(with: UserModel.self)
        
        data.user.forEach { user in
            if user.id == "1" {
                profile = [.profile(user),
                           .wallet(user.amount),
                           .address(user.addresses)]
            }
        }
    }
}

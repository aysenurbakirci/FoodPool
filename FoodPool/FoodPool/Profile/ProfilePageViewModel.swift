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
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func titleForHeaderInSection(for section: Int) -> String?
    func modelForSection(at index: IndexPath) -> ProfilePageSection
}

final class ProfilePageViewModel: ProfilePageViewModelProtocol {
    
    private var profile: [ProfilePageSection] = []
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
                           .address(user.addresses),
                            .button]
            }
        }
    }
    
    func numberOfSections() -> Int {
        return profile.count
    }
    
    func numberOfRowsInSection(for section: Int) -> Int {
        return profile[section].numberRowsInSection
    }
    
    func titleForHeaderInSection(for section: Int) -> String? {
        return profile[section].titleInSection
    }
    
    func modelForSection(at index: IndexPath) -> ProfilePageSection {
        return profile[index.section]
    }
}

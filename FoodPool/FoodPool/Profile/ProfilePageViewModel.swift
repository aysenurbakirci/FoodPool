//
//  ProfilePageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift

protocol ProfilePageViewModelProtocol {
    var delegate: ProfilePageViewModelDelegate? { get set }
    func loadData()
    func numberOfSections() -> Int
    func numberOfRowsInSection(for section: Int) -> Int
    func titleForHeaderInSection(for section: Int) -> String?
    func modelForSection(at index: IndexPath) -> ProfilePageSection
}

protocol ProfilePageViewModelDelegate:  AnyObject {
    func reloadTableView()
}

final class ProfilePageViewModel: ProfilePageViewModelProtocol {
    
    var delegate: ProfilePageViewModelDelegate?
    
    private var profile: [ProfilePageSection] = []
    private var bag = DisposeBag()
    
    func loadData() {
        let data = FoodPoolService.getUser(id: 1)
        
        data
            .subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            self.profile = [.profile(model.first!),
                            .wallet(model.first!.amount),
                            .address(model.first!.addresses),
                            .button]
            print(self.profile)
            self.delegate?.reloadTableView()
        }).disposed(by: bag)
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

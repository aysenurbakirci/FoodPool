//
//  ProfilePageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift
import RxCocoa

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

final class ProfilePageViewModel: ProfilePageViewModelProtocol, ActivityHandler {
    
    var isLoading = BehaviorRelay<Bool>(value: false)
    var onError = BehaviorRelay<Error?>(value: nil)
    
    var delegate: ProfilePageViewModelDelegate?
    private var profile: [ProfilePageSection] = []
    private var bag = DisposeBag()
    
    init() {}
    
    func loadData() {
        isLoading.accept(true)
        
        let data = FoodPoolService.getUser(id: 1)

        data
            .do(onNext: { _ in
                self.isLoading.accept(false)
            })
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                self.profile = [.profile(model.first!),
                                .wallet(model.first!.amount),
                                .address(model.first!.addresses),
                                .button]
                self.delegate?.reloadTableView()
            }, onError: { [weak self] error in
                self?.onError.accept(error)
            })
            .disposed(by: bag)
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

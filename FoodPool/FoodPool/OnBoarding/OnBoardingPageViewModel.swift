//
//  OnBoardingPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift

protocol OnBoardingPageViewModelProtocol {
    func numberOfItemsInSection() -> Int
    func getModel(to index: Int) -> OnBoarding
    func loadData()
}

final class OnBoardingPageViewModel: OnBoardingPageViewModelProtocol {
    
    private var onBoardingList: [OnBoarding] = []
    private var bag = DisposeBag()

    func loadData() {
        let data = FoodPoolService.getOnBoarding()
        
        data.subscribe(onNext: { [weak self] onBoarding in
            guard let self = self else { return }
            self.onBoardingList = onBoarding
        }).disposed(by: bag)
    }
    
    func numberOfItemsInSection() -> Int {
        return onBoardingList.count
    }
    
    func getModel(to index: Int) -> OnBoarding {
        return onBoardingList[index]
    }
}

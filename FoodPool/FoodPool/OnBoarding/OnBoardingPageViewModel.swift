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
}

final class OnBoardingPageViewModel: OnBoardingPageViewModelProtocol {
    
    private var onBoardingList: [OnBoarding] = []
    private var bag = DisposeBag()

    init(onBoardingData: [OnBoarding]) {
        self.onBoardingList = onBoardingData
    }
    
    func numberOfItemsInSection() -> Int {
        return onBoardingList.count
    }
    
    func getModel(to index: Int) -> OnBoarding {
        return onBoardingList[index]
    }
}

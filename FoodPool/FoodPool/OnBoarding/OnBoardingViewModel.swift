//
//  OnBoardingViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import FoodPoolAPI

protocol OnBoardingViewModelProtocol {
    func dataCount() -> Int
    func getModel(to index: Int) -> OnBoarding
    func loadData()
}

final class OnBoardingViewModel: OnBoardingViewModelProtocol {
    
    private var onBoardingList: [OnBoarding] = []
    private var api: BundleAPIProtocol!
    
    init(api: BundleAPIProtocol) {
        self.api = api
    }
    
    func loadData() {
        let data = api.getData(with: OnBoardingModel.self)
        onBoardingList = data.onBoarding
    }
    
    func dataCount() -> Int {
        return onBoardingList.count
    }
    
    func getModel(to index: Int) -> OnBoarding {
        return onBoardingList[index]
    }
}

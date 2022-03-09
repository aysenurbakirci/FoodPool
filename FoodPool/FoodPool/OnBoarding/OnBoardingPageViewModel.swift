//
//  OnBoardingPageViewModel.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import FoodPoolAPI

protocol OnBoardingPageViewModelProtocol {
    func numberOfItemsInSection() -> Int
    func getModel(to index: Int) -> OnBoarding
    func loadData()
}

final class OnBoardingPageViewModel: OnBoardingPageViewModelProtocol {
    
    private var onBoardingList: [OnBoarding] = []
    private var api: BundleAPIProtocol!
    
    init(api: BundleAPIProtocol) {
        self.api = api
    }
    
    func loadData() {
        let data = api.getData(with: OnBoardingModel.self)
        onBoardingList = data.onBoarding
    }
    
    func numberOfItemsInSection() -> Int {
        return onBoardingList.count
    }
    
    func getModel(to index: Int) -> OnBoarding {
        return onBoardingList[index]
    }
}

//
//  LaunchViewModel.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 16.03.2022.
//

import Foundation
import FoodPoolAPI
import RxSwift
import RxCocoa

//MARK: - Delegate
protocol LaunchViewModelDelegate {
    func animate(data: [OnBoarding])
}

//MARK: - Protocol
protocol LaunchViewModelProtocol {
    var delegate: LaunchViewModelDelegate? { get set }
    func loadData()
}

final class LaunchViewModel: LaunchViewModelProtocol, ActivityHandler {
    
    //MARK: - ActivityHandler Properties
    var isLoading = BehaviorRelay<Bool>(value: false)
    var onError = BehaviorRelay<Error?>(value: nil)
    
    //MARK: - Properties
    var delegate: LaunchViewModelDelegate?
    private var bag = DisposeBag()
    
    //MARK: - Load Data
    func loadData() {
        isLoading.accept(true)
        
        let onBoarding = FoodPoolService.getOnBoarding()
        
        onBoarding
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                self?.isLoading.accept(false)
            })
            .subscribe(onNext: { [weak self] data in
                guard let self = self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.delegate?.animate(data: data)
                }
            
            }, onError: { [weak self] error in
                self?.onError.accept(error)
            })
            .disposed(by: bag)
    }
}

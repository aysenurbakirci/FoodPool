//
//  LaunchViewController.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import UIKit
import FoodPoolKit
import AutoLayoutHelper
import RxSwift
import FoodPoolAPI

class LaunchViewController: UIViewController {
    
    let imageView: UIImageView = .create(
        image: .readyOrder,
        tintColor: .mainColor,
        isOpaque: true
    )
    
    let activityIndicator: UIActivityIndicatorView = .create(
        style: .large,
        hidesWhenStopped: true,
        backgroundColor: .systemBackground
    )
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        view.addSubviews(imageView, activityIndicator)
        
        activityIndicator.fillSuperView()
        activityIndicator.startAnimating()

        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
    }
}

extension LaunchViewController {
    
    private func loadData() {
        let onBoarding = FoodPoolService.getOnBoarding()
        onBoarding
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                self?.activityIndicator.stopAnimating()
            })
            .subscribe(onNext: { [weak self] data in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.animate(loadedData: data)
                }
            })
            .disposed(by: bag)
    }

}

extension LaunchViewController {
    private func animate(loadedData: [OnBoarding]) {
        let size = self.view.frame.size.width * 1.5
        let diffX = (size - self.view.frame.size.width) / -2
        let diffY = (self.view.frame.size.height - size) / 2
        
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: diffX, y: diffY, width: size, height: size)
        }
        
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 0
        } completion: { isDone in
            if isDone {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.openApplication(data: loadedData)
                }
            }
        }
    }
    
    private func openApplication(data: [OnBoarding]) {
        let onBoarding = OnBardingPageBuilder.build(data: data)
        let tabBar = TabBarController()
        tabBar.onBoardingPage = onBoarding
        tabBar.modalTransitionStyle = .crossDissolve
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true, completion: nil)
    }
}

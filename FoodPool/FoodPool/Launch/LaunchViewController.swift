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

class LaunchViewController: UIViewController, ActivityDisplayer {

    //MARK: - UI Properties
    let imageView: UIImageView = .create(
        image: .logo,
        tintColor: .mainColor,
        isOpaque: true
    )
    
    //MARK: - Properties
    let bag = DisposeBag()
    var viewModel = LaunchViewModel()

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        view.addSubview(imageView)
        viewModel.delegate = self
        viewModel.loadData()
        
        bindLoading()
        bindErrorHandling()
    }
    
    //MARK: - ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
    }
}

//MARK: - Delegate Methods
extension LaunchViewController: LaunchViewModelDelegate {
    
    func animate(data: [OnBoarding]) {
        let size = self.view.frame.size.width * 1.5
        let diffX = (size - self.view.frame.size.width) / -2
        let diffY = (self.view.frame.size.height - size) / 2
        
        //Image animation
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: diffX, y: diffY, width: size, height: size)
        }
        
        //Page animation
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 0
        } completion: { isDone in
            if isDone {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.openApplication(data: data)
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

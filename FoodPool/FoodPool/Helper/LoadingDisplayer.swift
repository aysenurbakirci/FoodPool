//
//  LoadingDisplayer.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import AutoLayoutHelper

public protocol LoadingDisplayer {
    var isLoadingData: Binder<Bool> { get }
}

public extension View where Self: LoadingDisplayer, Self.VM: RemoteLoading {
    func bindLoading() {
        viewModel
            .isLoading
            .observe(on: MainScheduler.instance)
            .bind(to: isLoadingData)
            .disposed(by: bag)
    }
}

public extension LoadingDisplayer where Self: UIViewController {
    var isLoadingData: Binder<Bool> {
        return Binder(self) { [weak self] _, loadingData in
            guard let self = self else { return }
            loadingData ? self.showLoadingView() : self.hideLoadingView()
        }
    }
    
    private func showLoadingView() {
        let activityIndicatorView = UIView(frame: self.view.bounds)
        activityIndicatorView.layer.zPosition = .greatestFiniteMagnitude
        activityIndicatorView.tag = 999
        activityIndicatorView.backgroundColor = .background
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperView()
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .mainColor
        activityIndicator.startAnimating()
        activityIndicatorView.addSubview(activityIndicator)
        activityIndicator.fillSuperView()
    }
    
    private func hideLoadingView() {
        self.view.viewWithTag(999)?.removeFromSuperview()
    }
}

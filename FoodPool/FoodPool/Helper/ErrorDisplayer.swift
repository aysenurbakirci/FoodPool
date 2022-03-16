//
//  ErrorDisplayer.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 15.03.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import AutoLayoutHelper
import LayoutKit

public protocol ErrorDisplayer {
    var errorObject: Binder<Error?> { get }
}

public extension View where Self: ErrorDisplayer, Self.VM: RemoteLoading {
    func bindErrorHandling() {
        viewModel
            .onError
            .compactMap { $0 }
            .bind(to: errorObject)
            .disposed(by: bag)
    }
}

public extension ErrorDisplayer where Self: UIViewController {
    var errorObject: Binder<Error?> {
        return Binder(self) { [weak self] _, error in
            self?.showErrorView(error)
        }
    }
    
    private func showErrorView(_ err: Error?) {
        let errorView = UIView(frame: self.view.bounds)
        errorView.layer.zPosition = .greatestFiniteMagnitude
        errorView.tag = 998
        errorView.backgroundColor = .background
        self.view.addSubview(errorView)
        errorView.fillSuperView()
        
        let imageView = UIImageView(image: .unknown)
        imageView.tintColor = .secondaryColor
        imageView.sizeAnchor(height: 100.0)
        imageView.aspect(ratio: 1.25)
        
        let label: UILabel = .create(
            lblText: "Sorry, something went wrong. Please try again.",
            font: .boldLarge,
            textColor: .secondaryTitle,
            numberOfLines: 0,
            textAlignment: .center,
            sizeToFit: true
        )
        
        let stack: UIStackView = .create(
            subviews: [imageView, label],
            axis: .vertical,
            distribution: .equalSpacing,
            alignment: .center,
            spacing: 6.0
        )
        
        errorView.addSubview(stack)
        stack.anchor(leading: view.leadingAnchor,
                     trailing: view.trailingAnchor,
                     padding: .equalPadding(10.0))
        stack.centerYToSuperView()
    }
}

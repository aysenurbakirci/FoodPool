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

public protocol ErrorDisplayer {
    var errorObject: Binder<Error?> { get }
}

public extension View where Self: ErrorDisplayer, Self.VM: RemoteLoading {
    func bindErrorHandling() {
        viewModel
            .onError
            .compactMap { $0 }
            .subscribe(onNext: { [weak self] err in
                self?.errorObject.on(.next(err))
            })
            .disposed(by: bag)
    }
}

public extension ErrorDisplayer where Self: UIViewController {
    var errorObject: Binder<Error?> {
        return Binder(self) { [weak self] _, error in
            self?.makeErrorAlert(error?.localizedDescription ?? "invalid error.")
        }
    }
    
    func makeErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

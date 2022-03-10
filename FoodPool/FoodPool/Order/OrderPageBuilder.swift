//
//  OrderPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

final class OrderPageBuilder {
    static func build() -> UIViewController {
        let vc = OrderPageViewController()
        let api = BundleAPI()
        let vm = OrderPageViewModel(api: api)
        vc.viewModel = vm
        return vc
    }
}

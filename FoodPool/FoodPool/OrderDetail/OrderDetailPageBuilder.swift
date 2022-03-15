//
//  OrderDetailPageBuilder.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 10.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

final class OrderDetailPageBuilder {
    static func build(selectedOrder: Order) -> UIViewController {
        let vm = OrderDetailPageViewModel(order: selectedOrder)
        let vc = OrderDetailPageViewController()
        vc.viewModel = vm
        return vc
    }
}

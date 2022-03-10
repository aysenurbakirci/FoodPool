//
//  BasketPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit

final class BasketPageBuilder {
    static func build() -> UIViewController {
        let vm = BasketPageViewModel()
        let vc = BasketPageViewController()
        vc.viewModel = vm
        return vc
    }
}

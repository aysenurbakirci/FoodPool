//
//  BasketPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit

//MARK: - Page Builder
final class BasketPageBuilder {
    static func build() -> UIViewController {
        let vm = BasketPageViewModel()
        let vc = BasketPageViewController()
        vc.viewModel = vm
        return vc
    }
}

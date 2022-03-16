//
//  DetailPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

//MARK: - Page Builder
public class DetailPageBuilder {
    public static func build(model: Restaurant) -> UIViewController {
        let vm = DetailPageViewModel(model: model)
        let vc = DetailPageViewController()
        vc.viewModel = vm
        return vc
    }
}

//
//  MainPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

public class MainPageBuilder {
    public static func build() -> UIViewController {
        let api = BundleAPI()
        let vm = MainPageViewModel(api: api)
        let vc = MainPageViewController()
        vc.viewModel = vm
        return vc
    }
}

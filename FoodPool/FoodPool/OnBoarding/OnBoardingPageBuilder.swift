//
//  OnBoardingPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

public class OnBardingPageBuilder {
    public static func build() -> UIViewController {
        let api = BundleAPI()
        let vm = OnBoardingPageViewModel(api: api)
        let vc = OnBoardingPageViewController()
        vc.viewModel = vm
        return vc
    }
}

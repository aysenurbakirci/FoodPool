//
//  OnBoardingPageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 2.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

//MARK: - Page Builder
public class OnBardingPageBuilder {
    public static func build(data: [OnBoarding]) -> UIViewController {
        let vm = OnBoardingPageViewModel(onBoardingData: data)
        let vc = OnBoardingPageViewController()
        vc.viewModel = vm
        return vc
    }
}

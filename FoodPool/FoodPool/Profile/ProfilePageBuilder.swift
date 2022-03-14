//
//  ProfilePageBuilder.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 4.03.2022.
//

import Foundation
import UIKit
import FoodPoolAPI

public class ProfilePageBuilder {
    public static func build() -> UIViewController {
        let vm = ProfilePageViewModel()
        let vc = ProfilePageViewController()
        vc.viewModel = vm
        return vc
    }
}

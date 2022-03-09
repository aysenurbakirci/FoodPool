//
//  TabBarView.swift
//  FoodPoolKit
//
//  Created by Ayşe Nur Bakırcı on 9.03.2022.
//

import Foundation
import UIKit

public extension UITabBarController {
    
    func foodPoolTabConfig() {
        self.tabBar.tintColor = .mainColor
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.shadowOffset = .zero
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.shadowColor = UIColor.shadow.cgColor
        self.tabBar.layer.shadowRadius = 10.0
        self.tabBar.layer.shadowOpacity = 1.0
        self.tabBar.layer.cornerRadius = 30.0
        self.tabBar.layer.borderWidth = 0.0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = .white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    func foodPoolNavigationConfig() {
        let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = .mainColor
        let proxy = UINavigationBar.appearance()
            proxy.tintColor = .white
            proxy.standardAppearance = appearance
            proxy.scrollEdgeAppearance = appearance
        
        
    }

}

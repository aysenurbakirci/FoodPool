//
//  TabBarController.swift
//  FoodPool
//
//  Created by Ayşe Nur Bakırcı on 8.03.2022.
//

import Foundation
import UIKit
import LayoutKit
import FoodPoolKit

final class TabBarController: UITabBarController {
    
    //MARK: - Pages
    let mainPage = MainPageBuilder.build()
    let basketPage = BasketPageBuilder.build()
    let profilePage = ProfilePageBuilder.build()
    let orderPage = OrderPageBuilder.build()
    var onBoardingPage: UIViewController? = nil

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        applyPages()
        foodPoolTabConfig()
        foodPoolNavigationConfig()
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        guard let onBoardingPage = onBoardingPage else {
            return
        }
        present(onBoardingPage, animated: true, completion: nil)
    }
}

private extension TabBarController {
    
    //MARK: - Apply Pages
    func applyPages() {
        let mainNavigation = UINavigationController(rootViewController: mainPage)
        let basketNavigation = UINavigationController(rootViewController: basketPage)
        let orderNavigation = UINavigationController(rootViewController: orderPage)
        let profileNavigation = UINavigationController(rootViewController: profilePage)
        
        setViewControllers([mainNavigation,
                            basketNavigation,
                            orderNavigation,
                            profileNavigation,
                            ViewController()], animated: true)
        
        mainNavigation.tabBarItem = UITabBarItem(title: "Home",
                                                 image: .home,
                                                 tag: 0)
        basketNavigation.tabBarItem = UITabBarItem(title: "Basket",
                                                   image: .basket,
                                                   tag: 1)
        profileNavigation.tabBarItem = UITabBarItem(title: "Profile",
                                                    image: .profile,
                                                    tag: 2)
        orderNavigation.tabBarItem = UITabBarItem(title: "Order",
                                                  image: .order,
                                                  tag: 3)
    }
}

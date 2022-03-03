//
//  SceneDelegate.swift
//  FoodPool
//
//  Created by Ayşenur Bakırcı on 25.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ProfileViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}


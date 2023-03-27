//
//  SceneDelegate.swift
//  tip-calculator
//
//  Created by Rahul Nimje on 18/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = CalculatorVC()
//        window.rootViewController = UINavigationController(rootViewController: vc)
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }


}


//
//  SceneDelegate.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = scene as? UIWindowScene else { return }

        let navigation = UINavigationController()
        let window = UIWindow(windowScene: scene)

        coordinator = SplashCoordinator(window: window, navigation: navigation)
        coordinator?.start()
    }
}

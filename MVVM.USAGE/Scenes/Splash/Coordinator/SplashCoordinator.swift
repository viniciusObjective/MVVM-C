//
//  SplashCoordinator.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit

final class SplashCoordinator: Coordinator {
    var window: UIWindow
    var navigation: UINavigationController

    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigation = navigation
        window.configure(with: navigation)
    }

    func start() {
        let splashVC = SplashViewController(self, viewModel: ViewModel())
        navigation.pushViewController(splashVC, animated: true)
    }
}

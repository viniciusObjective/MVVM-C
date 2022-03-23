//
//  UIWindow.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit

extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigation
        navigation.configure()
    }
}

private extension UINavigationController {
    func configure() {
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.isEnabled = false
    }
}

//
//  Coordinator.swift
//  MVVM.USAGE
//
//  Created by Vinícius D. Brandão on 23/03/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var window: UIWindow { get }
    var navigation: UINavigationController { get }

    init(window: UIWindow, navigation: UINavigationController)

    func start()
}

//
//  AppDelegate.swift
//  GlobalVariableDemo
//
//  Created by Su T. Nguyen on 14/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupEnvironment()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = makeTabBar()
        window?.makeKeyAndVisible()
        return true
    }

    private func setupEnvironment() {
        Environment.shared.register(UserSettings())
        Environment.shared.register(AppSettings())
    }

    private func makeTabBar() -> UITabBarController {
        let tabBarViewController = UITabBarController()

        let first = UINavigationController(rootViewController: FirstViewController())
        let firstItem = UITabBarItem(title: "First", image: nil, selectedImage: nil)
        firstItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        first.tabBarItem = firstItem

        let second = UINavigationController(rootViewController: SecondViewController())
        let secondItem = UITabBarItem(title: "Second", image: nil, selectedImage: nil)
        secondItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        second.tabBarItem = secondItem

        let third = UINavigationController(rootViewController: ThirdViewController())
        let thirdItem = UITabBarItem(title: "Third", image: nil, selectedImage: nil)
        thirdItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        third.tabBarItem = thirdItem

        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key : Any] =
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        appearance.setTitleTextAttributes(attributes , for: .normal)

        tabBarViewController.setViewControllers([first, second, third], animated: true)

        return tabBarViewController
    }
}


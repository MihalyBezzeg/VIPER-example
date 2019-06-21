//
//  AppDelegate.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import UIKit
import Swinject

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let rootVc = self.inputFormBuilder()?.buildInputFormModule() else {
            return false
        }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: rootVc)
        self.window?.makeKey()

        return true
    }

    fileprivate func inputFormBuilder() -> InputFormBuilderInterface? {
        return Container.sharedContainer.resolve(InputFormBuilderInterface.self)
    }
}

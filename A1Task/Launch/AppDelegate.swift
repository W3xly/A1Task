//
//  AppDelegate.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appCoordinator = AppCoordinator()
        appCoordinator?.start()

        return true
    }
}


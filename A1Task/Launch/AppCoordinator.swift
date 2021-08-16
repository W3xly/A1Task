//
//  AppCoordinator.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

final class AppCoordinator {

    var window: UIWindow?

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    func start() {
        let listCoordinator = ListCoordinator(type: .replaceWindow, inputData: ListInputData())
        listCoordinator.start()
    }
}


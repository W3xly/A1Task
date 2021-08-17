//
//  Coordinator.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

typealias Coordinator<InputDataType> = CoordinatorProtocol & CoordinatorSuperclass<InputDataType>

enum CoordinatorType {
    case replaceWindow
    case modal(UIViewController)
    case push(UINavigationController)
}

protocol CoordinatorProtocol {
    associatedtype InputDataType

    var inputData: InputDataType { get }

    func start()
    func stop()
}

extension CoordinatorProtocol {
    func stop() {}
}

class CoordinatorSuperclass<InputDataType> {

    // MARK: - Properties

    var type: CoordinatorType
    var inputData: InputDataType

    // MARK: - Init

    init(
        type: CoordinatorType,
        inputData: InputDataType
    ) {
        self.type = type
        self.inputData = inputData
    }

    // MARK: - Presentation

    func presentByModal(viewController: UIViewController, animated: Bool = true) {
        if case .modal(let sourceViewController) = type {
            sourceViewController.present(viewController, animated: animated)
        } else {
            assertionFailure("You are trying to present scene by modal, but you didnt initialized its Coordinator as modal.")
        }
    }

    func presentByPush(viewController: UIViewController, animated: Bool = true) {
        if case .push(let navigationController) = type {
            navigationController.pushViewController(viewController, animated: animated)
        } else {
            assertionFailure("You are trying to present scene by push, but you didnt initialized its Coordinator as push.")
        }
    }

    func presentByReplaceWindow(viewController: UIViewController) {
        if case .replaceWindow = type {
            if let window = UIApplication.shared.keyWindow {
                    window.rootViewController = UINavigationController(rootViewController: viewController)
                } else {
                    assertionFailure("You are trying to present scene by replaceWindow, but the window was not initialized.")
                }
            } else {
                assertionFailure("You are trying to present scene by replaceWindow, but you didnt initialized its Coordinator as window replacement.")
            }
        }

    // MARK: - Dismissal

    func stop() {
        switch type {
        case .modal(let sourceViewController):
            sourceViewController.dismiss(animated: true)
        case .push(let navigationController):
            navigationController.popViewController(animated: true)
        default:
            assertionFailure("CoordinatorType [\(type)] does not have implemented stop method.")
        }
    }
}

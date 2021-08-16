//
//  ListCoordinator.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

struct ListInputData {}

final class ListCoordinator: Coordinator<ListInputData> {

    typealias InputDataType = ListInputData

    func start() {
        let viewController = ListViewController()
        viewController.viewModel = ListViewModel(coordinator: self, viewController: viewController)

        switch type {
        case .modal:
            presentByModal(viewController: viewController)
        case .push:
            presentByPush(viewController: viewController)
        case .replaceWindow:
            presentByReplaceWindow(viewController: viewController)
        }
    }
}


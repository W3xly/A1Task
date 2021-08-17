//
//  DetailCoordinator.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import UIKit

struct DetailInputData {
    let card: Card
}

final class DetailCoordinator: Coordinator<DetailInputData> {

    typealias InputDataType = DetailInputData

    func start() {
        let viewController = DetailViewController()
        viewController.viewModel = DetailViewModel(coordinator: self, viewController: viewController, inputData: inputData)

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


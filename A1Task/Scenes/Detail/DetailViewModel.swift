//
//  DetailViewModel.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import Foundation

final class DetailViewModel {
    private let coordinator: DetailCoordinator
    private weak var viewController: DetailViewControllerActions?

    init(coordinator: DetailCoordinator, viewController: DetailViewControllerActions) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
}

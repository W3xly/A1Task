//
//  ListViewModel.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

final class ListViewModel {
    private let coordinator: ListCoordinator
    private weak var viewController: ListViewControllerActions?

    init(coordinator: ListCoordinator, viewController: ListViewControllerActions) {
        self.coordinator = coordinator
        self.viewController = viewController

        _ = ApiService.manager.getMurlocs().done { cards in
            print(cards.map { $0.name })
        }
    }
}


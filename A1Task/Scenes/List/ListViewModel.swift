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

    var cards: [Card] = []
    var numberOfRows: Int {
        return cards.count
    }

    init(coordinator: ListCoordinator, viewController: ListViewControllerActions) {
        self.coordinator = coordinator
        self.viewController = viewController

        _ = ApiService.manager.getMurlocs().done { cards in
            self.cards = cards
            self.viewController?.reloadTableView()
        }
    }
}


//
//  ListViewModel.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

enum SortingOption {
    case manaCost
    case attack
    case health
}

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

            // Removing duplicate card by name
            self.cards = cards.removingDuplicates(byKey: { $0.name })
            self.viewController?.reloadTableView()
        }
    }

    func sortBy(option: SortingOption) {
        switch option {
        case .manaCost:
            cards = cards.sorted(by: { $0.cost ?? 0 < $1.cost ?? 0 })
        case .attack:
            cards = cards.sorted(by: { $0.attack ?? 0 < $1.attack ?? 0 })
        case .health:
            cards = cards.sorted(by: { $0.health ?? 0 < $1.health ?? 0 })
        }
        viewController?.reloadTableView()
    }
}


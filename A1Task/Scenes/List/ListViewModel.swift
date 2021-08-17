//
//  ListViewModel.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

enum SortingOption: Int {
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
    }

    func viewDidLoad() {
        getCards()
    }

    func getCards() {
        viewController?.startLoading()

        _ = ApiService.manager.getMurlocs().done { cards in
            // Remove duplicate cards by name
            self.cards = cards.removingDuplicates(byKey: { $0.name })

            self.sortBy(option: SortingOption(rawValue: Defaults.integer(forKey: DEFAULTS_SORTING)) ?? .manaCost)
            self.viewController?.reloadTableView()
            self.viewController?.stopLoading()
        }.catch { error in
            self.viewController?.showError(with: error.localizedDescription)
            self.viewController?.stopLoading()
        }
    }

    func sortBy(option: SortingOption) {
        switch option {
        case .manaCost:
            cards = cards.sorted(by: { $0.cost ?? 0 > $1.cost ?? 0 })
        case .attack:
            cards = cards.sorted(by: { $0.attack ?? 0 > $1.attack ?? 0 })
        case .health:
            cards = cards.sorted(by: { $0.health ?? 0 > $1.health ?? 0 })
        }

        Defaults.setValue(option.rawValue, forKey: DEFAULTS_SORTING)
        viewController?.reloadTableView()
    }
}


//
//  DetailViewModel.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import Foundation

enum DetailLabelType {
    case cardSet
    case playerClass
    case rarity

    var descriptionText: String {
        switch self {
        case .cardSet:
            return "Card Set: "
        case .playerClass:
            return "Player Class: "
        case .rarity:
            return "Card Rarity: "
        }
    }
}

final class DetailViewModel {
    private let coordinator: DetailCoordinator
    private weak var viewController: DetailViewControllerActions?

    let card: Card
    var cardSet: String
    var playerClass: String
    var rarity: String

    init(coordinator: DetailCoordinator, viewController: DetailViewControllerActions, inputData: DetailInputData) {
        self.coordinator = coordinator
        self.viewController = viewController
        card = inputData.card
        cardSet = inputData.card.cardSet ?? "unknown"
        playerClass = inputData.card.playerClass ?? "unknown"
        rarity = inputData.card.rarity ?? "unknown"

    }

    func dismissScene() {
        coordinator.stop()
    }

    func getLabelString(for label: DetailLabelType) -> NSAttributedString {
        switch label {
        case .cardSet:
            return label.descriptionText.attributedString(bold: true) + cardSet.attributedString()
        case .playerClass:
            return label.descriptionText.attributedString(bold: true) + playerClass.attributedString()
        case .rarity:
            return label.descriptionText.attributedString(bold: true) + rarity.attributedString()
        }
    }
}

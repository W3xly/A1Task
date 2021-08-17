//
//  Card.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

struct Card: Codable, Hashable {

    let cardId: String?
    let name: String?
    let type: String?
    let cost: Int?
    let attack: Int?
    let health: Int?
    let race: String
    let img: String?
    let playerClass: String?
    let rarity: String?
    let cardSet: String?

    var imgURL: URL? {
        guard let stringURL = img else { return nil }
        return URL(string: stringURL)
    }
}

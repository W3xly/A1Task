//
//  Card.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

struct Card: Codable {
    let cardId: String?
    let name: String?
    let type: String?
    let cost: Int?
    let attack: Int?
    let health: Int?
    let race: String
    let img: String?
}

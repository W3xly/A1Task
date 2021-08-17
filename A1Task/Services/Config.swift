//
//  Config.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

struct HTTPHeader {
    let value: String
    let key: String
}

let rapidApiKeyHeader = HTTPHeader(value: "a4e901e98dmsh749094c7a96a7f3p199444jsn636ba503b55b",
                             key: "x-rapidapi-key")
let rapidApiHostHeader = HTTPHeader(value: "omgvamp-hearthstone-v1.p.rapidapi.com",
                                   key: "x-rapidapi-host")

public let Defaults = UserDefaults.standard
public let DEFAULTS_SORTING = "sorting"

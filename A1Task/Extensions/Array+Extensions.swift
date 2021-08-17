//
//  Array+Extensions.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import Foundation

extension Array where Element: Hashable {

    func removingDuplicates<T: Hashable>(byKey key: (Element) -> T)  -> [Element] {
         var result = [Element]()
         var seen = Set<T>()
         for value in self {
             if seen.insert(key(value)).inserted {
                 result.append(value)
             }
         }
         return result
     }
}

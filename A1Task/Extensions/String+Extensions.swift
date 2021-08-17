//
//  String+Extensions.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import UIKit

extension String {
    func attributedString(bold: Bool = false) -> NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.font: bold ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 16)])
    }
}


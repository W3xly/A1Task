//
//  NSAttributedString+Extensions.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import UIKit

extension NSAttributedString {
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }


}

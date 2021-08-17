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

extension String {
    func attributedString(bold: Bool = false) -> NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.font: bold ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 16)])
    }
}

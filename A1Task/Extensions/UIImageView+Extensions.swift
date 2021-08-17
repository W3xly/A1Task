//
//  UIImageView+Extensions.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL?, placeholderImage: UIImage = UIImage(named: "card_placeholder")!, completion: ((UIImage?) -> Void)? = nil) {

        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        sd_setImage(with: url, placeholderImage: placeholderImage)
    }
}

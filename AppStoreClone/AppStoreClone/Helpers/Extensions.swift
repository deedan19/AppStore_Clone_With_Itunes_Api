//
//  Extensions.swift
//  AppStoreClone
//
//  Created by Decagon on 18/07/2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
//        self.constrainWidth(constant: width ?? 0)
//        self.constrainHeight(constant: height ?? 0)
    }
}

extension UIButton {
    convenience init(title: String, cornerRadius: CGFloat?, color: UIColor?, width: CGFloat?, height: CGFloat?, font: UIFont?) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.backgroundColor = (color ?? nil)?.cgColor
        self.titleLabel?.font = font 
        self.constrainWidth(constant: width ?? 0)
        self.constrainHeight(constant: height ?? 0)
    }
}

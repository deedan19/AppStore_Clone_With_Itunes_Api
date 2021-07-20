//
//  HorizontalStackView.swift
//  AppStoreClone
//
//  Created by Decagon on 15/07/2021.
//

import UIKit

class HorizontalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .horizontal
    }
   
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

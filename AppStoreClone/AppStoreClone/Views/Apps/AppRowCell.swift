//
//  AppRowCell.swift
//  AppStoreClone
//
//  Created by Decagon on 18/07/2021.
//

import UIKit
import SDWebImage

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    
    let companyLabel = UILabel(text: "Company name", font: .boldSystemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET", cornerRadius: 16, color: UIColor(white: 0.95, alpha: 1), width: 80, height:  32, font: .boldSystemFont(ofSize: 16))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        let labelStack = VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4)
        let horizontalStack = HorizontalStackView(arrangedSubviews: [imageView, labelStack, getButton], spacing: 16)
        horizontalStack.alignment = .center
        addSubview(horizontalStack)
        horizontalStack.fillSuperview()
        imageView.backgroundColor = .purple
    }
    
    func setup (with model: FeedResult ) {
        nameLabel.text = model.name
        companyLabel.text = model.artistName
        imageView.sd_setImage(with: URL(string: model.artworkUrl100))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

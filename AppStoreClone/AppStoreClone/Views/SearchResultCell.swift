//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Decagon on 15/07/2021.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: " + String(format: "%.1f", appResult.averageUserRatingForCurrentVersion ?? 0)
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl60)!, completed: nil)
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.text = "APP NAME"
        return nameLbl
    }()
    
    let categoryLabel: UILabel = {
        let catLbl = UILabel()
        catLbl.text = "Photos & Videos"
        return catLbl
    }()
    
    let ratingsLabel: UILabel = {
        let ratingLbl = UILabel()
        ratingLbl.text = "9.26M"
        return ratingLbl
    }()
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 68).isActive = true
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return button
    }()
    
    lazy var screenShot1ImageView = self.createScreenShotImageView()
    lazy var screenShot2ImageView = self.createScreenShotImageView()
    lazy var screenShot3ImageView = self.createScreenShotImageView()
    
    func createScreenShotImageView () -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        
        let infoTopStackView = UIStackView (arrangedSubviews: [
                                                appIconImageView,
            VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel]),
                                                getButton
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenShot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopStackView, screenshotStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
       

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

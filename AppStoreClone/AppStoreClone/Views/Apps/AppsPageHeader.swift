//
//  AppsPageHeader.swift
//  AppStoreClone
//
//  Created by Decagon on 18/07/2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorinzontalController = AppHeaderHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHeaderHorinzontalController.view)
        appHeaderHorinzontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

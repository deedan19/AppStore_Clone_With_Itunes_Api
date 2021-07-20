//
//  BaseListController.swift
//  AppStoreClone
//
//  Created by Decagon on 16/07/2021.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

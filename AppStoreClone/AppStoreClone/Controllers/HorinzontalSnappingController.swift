//
//  HorinzontalSnappingController.swift
//  AppStoreClone
//
//  Created by Decagon on 19/07/2021.
//

import UIKit

class HorinzontalSnappingController: UICollectionViewController {
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        let itemWidth = collectionView.frame.width - 48
        
        let itemSpace = itemWidth + minimumInteritemSpacing
        var pageNumber = round(collectionView.contentOffset.x / itemSpace)
        
        let vX = velocity.x
        if vX > 0 {
            pageNumber += 1
        } else if vX < 0 {
            pageNumber -= 1
        }
        
        let nearestPageOffset = pageNumber * itemSpace
        return CGPoint(x: nearestPageOffset,
                       y: parent.y)
        
    }
}


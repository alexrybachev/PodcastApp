//
//  CustomLayout.swift
//  PodcastApp
//
//  Created by Kirill Taraturin on 03.10.2023.
//

import Foundation
import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    
    // MARK: - Public Properties
    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    // MARK: - Override Methods
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let cv = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = cv.numberOfItems(inSection: 0)
        
        if previousOffset > cv.contentOffset.x && velocity.x < 0.0 {
            currentPage = max(currentPage - 1, 0)
        } else if previousOffset < cv.contentOffset.x && velocity.x > 0.0 {
            currentPage = min(currentPage + 1, itemCount - 1)
        }

        let offset = updateOffSet(cv)
        
        previousOffset = offset
        
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
    
    // MARK: - Public Methods
    func updateOffSet(_ cv: UICollectionView) -> CGFloat {
        let w = cv.frame.width
        let itemW = itemSize.width
        let sp = minimumLineSpacing
        let edge = (w - itemW - sp*2) / 2
        let offset = (itemW + sp) * CGFloat(currentPage) - (edge + sp)
        
        return offset
    }
}

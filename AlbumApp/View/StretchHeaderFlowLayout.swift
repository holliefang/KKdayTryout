//
//  StretchHeaderFlowLayout.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class StretchHeaderFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                guard let collectionView = collectionView else {return}
                let width = collectionView.frame.width
                let contentOffsetY = collectionView.contentOffset.y
//                print(contentOffsetY)
                let height = attributes.frame.height - contentOffsetY
                guard contentOffsetY <= 0 else { return }
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}

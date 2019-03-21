//
//  BaseCollectionView.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/12.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    convenience init(scrollDirection: UICollectionView.ScrollDirection, frame:CGRect = .zero){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        self.init(frame: frame, collectionViewLayout: layout)
    }
    
}

//
//  CoverHeaderCollectionReusableView.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class CoverHeaderCollectionReusableView: UICollectionReusableView {
    
    static let cellId = "headerCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "album7")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

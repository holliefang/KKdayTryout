//
//  MyCollectionReusableView.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/10.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit

class MyUICollectionReusableView: UICollectionReusableView {
    var label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 40))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

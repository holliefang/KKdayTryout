//
//  PopTopViewCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/12.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit


class PopTopViewCell: UICollectionViewCell {
    static var cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.borderColor = UIColor.grayishColor
        bgView.layer.borderWidth = 1
        bgView.layer.cornerRadius = 10
        //            bgView.layer.masksToBounds = true
        return bgView
    }()
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
    
    func setup() {
        addSubview(bgView)
        addSubview(imageView)
        addSubview(titleLabel)
        
        bgView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, leading: nil, bottom: imageView.bottomAnchor, right: contentView.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        imageView.setAnchor(top: topAnchor,
                            left: leftAnchor,
                            leading: nil,
                            bottom: nil,
                            right: rightAnchor,
                            trailing: nil,
                            paddingTop: 1,
                            paddingLeft: 1,
                            paddingBottom: 1,
                            paddingRight: 1,
                            height: 250)
        
        titleLabel.setAnchor(top: imageView.bottomAnchor,
                             left: imageView.leftAnchor,
                             leading: nil,
                             bottom: nil,
                             right: nil,
                             trailing: nil,
                             paddingTop: 5,
                             paddingLeft: 0,
                             paddingBottom: 0,
                             paddingRight: 0)
    }
    
    func updateCellBy(trip: Travel) {
        self.imageView.image = trip.image
        self.titleLabel.text = trip.location.country
    }
    
}

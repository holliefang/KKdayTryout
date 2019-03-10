//
//  PopCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/6.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionView: UICollectionView {
    convenience init(scrollDirection: UICollectionView.ScrollDirection, frame:CGRect = .zero){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        self.init(frame: frame, collectionViewLayout: layout)
    }
        
}

extension PopCell: TripDelegate {
    func favoriteThis(index: IndexPath) {
        
    }
    
    func update(trip: Travel) {
        print("I AM THE Errand Runner")
    }
}

class PopCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    fileprivate let padding: CGFloat = 8
    fileprivate let cv = BaseCollectionView(scrollDirection: .horizontal)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cv)
        
        setup()
    }
    
    func setup() {
        cv.register(PopTopViewCell.self, forCellWithReuseIdentifier: PopTopViewCell.cellId)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        let frame = self.frame
        cv.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        cv.isPagingEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopTopViewCell.cellId, for: indexPath) as! PopTopViewCell
        
        let trip = trips[indexPath.row]
        cell.delegate = self
        cell.updateCellBy(trip: trip)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width / 2) - (padding * 2) , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    

    
    private class PopTopViewCell: UICollectionViewCell {
        static var cellId = "cellId"
        var delegate: TripDelegate?
        
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
            bgView.layer.borderColor = grayishColor
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
}


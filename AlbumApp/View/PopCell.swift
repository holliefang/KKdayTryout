//
//  PopCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/6.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit


class PopCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    fileprivate let padding: CGFloat = 8
    fileprivate let cv = BaseCollectionView(scrollDirection: .horizontal)
    var trips: [Travel] = []

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
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopTopViewCell.cellId, for: indexPath) as! PopTopViewCell
        let trip = trips[indexPath.item]
        cell.updateCellBy(trip: trip)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width / 2) - (padding * 2) , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    

    
    
}


//
//  TripCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/5.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit

extension TripCell: TripDelegate {
    func favoriteThis(index: IndexPath) {
        trips[index.row].isFavorited = !trips[index.row].isFavorited
        collectionView.reloadItems(at: [index])
        print("XXXXX")
    }
    
    func update(trip: Travel) {
    }
    
}

extension TripCell: ButtonDelegate {
    func buttonClicked(bool: Bool) {
        print("clicked")
    }
    
    
}

class TripCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .clear
        setup()
        
    
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        
        return cv
    }()
    
    let cellId = "cellId"
    
    func setup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let frame = self.frame
        collectionView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        collectionView.isPagingEnabled = true
        
        collectionView.register(TripTopViewCell.self, forCellWithReuseIdentifier: TripTopViewCell.reuseID)
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripTopViewCell.reuseID, for: indexPath) as! TripTopViewCell
        let trip = trips[indexPath.row]
        cell.delegate = self
        cell.updateCellBy(trip: trip)
        cell.favoriteButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width - 16, height: 300)
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("select")
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    @objc func tap() {
        print("HAHAHAHA")
    }

}


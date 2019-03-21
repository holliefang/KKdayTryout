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
        trips[index.item].isFavorited.toggle()
        mainController?.trips[index.item].isFavorited.toggle()

    }
}



class TripCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var mainController: MainViewController?
    var trips: [Travel] = [] {
        didSet {
            print("in trip cell")
            self.collectionView.reloadData()
        }
    }
    
    fileprivate let padding: CGFloat = 8
    var delegate: MoveDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16

        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        
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
    
    @objc func changeStatus(notification: Notification){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripTopViewCell.reuseID, for: indexPath) as! TripTopViewCell
        let trip = trips[indexPath.item]
        cell.trip = trip
        
        print("did trans trips between cells")
        
        cell.delegate = self
        cell.indexPath = indexPath
        cell.index = indexPath.row

        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width - (padding * 2 ), height: 300)
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.move(indexpath: indexPath)
        }
    }
    
}

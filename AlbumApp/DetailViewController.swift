//
//  DetailViewController.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/9.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import UIKit


extension DetailViewController: TripDelegate {
    func update(trip: Travel) {
        
    }
    
    func favoriteThis(index: IndexPath) {
        
    }
    
    
}

class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let padding: CGFloat = 16

    fileprivate func cellRegister() {
        self.collectionView!.register(DetailViewCell.self, forCellWithReuseIdentifier: DetailViewCell.reuseIdentifier)
        self.collectionView.register(CoverHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CoverHeaderCollectionReusableView.cellId)
    }
    
    fileprivate func setupLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white

 
        cellRegister()
        
        setupLayout()

        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.reuseIdentifier, for: indexPath) as! DetailViewCell

        let trip = trips[indexPath.row]
        cell.delegate = self
        cell.indexPath = indexPath
        cell.isFavorited = trip.isFavorited
        cell.updateCellBy(trip: trip)

        return cell


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - (2 * padding), height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CoverHeaderCollectionReusableView.cellId, for: indexPath)
        
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 340)
    }


}

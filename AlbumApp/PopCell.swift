//
//  PopCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/6.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit
//extension UICollectionView {
    class BaseCollectionView: UICollectionView {
    convenience init(scrollDirection: UICollectionView.ScrollDirection, frame:CGRect = .zero){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
//        let b = self.backgroundColor// = .purple
        self.init(frame: frame, collectionViewLayout: layout)
    }
        
}

class PopCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    
//    let collectionView: UICollectionView = {
//       let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return cv
//    }()
//    let cv2 = UICollectionView(scrollDirection: .horizontal)
    let cv = BaseCollectionView(scrollDirection: .horizontal)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(cv)
        
        setup()
    }
    
    func setup() {
        cv.register(PopTopViewCell.self, forCellWithReuseIdentifier: PopTopViewCell.cellId)
        cv.delegate = self
        cv.dataSource = self
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopTopViewCell.cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width / 2) - 16 , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

    
    private class PopTopViewCell: UICollectionViewCell {
        static var cellId = "cellId"
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .red
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}


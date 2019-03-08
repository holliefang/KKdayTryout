//
//  TripCell.swift
//  AlbumApp
//
//  Created by Sihan Fang on 2019/3/5.
//  Copyright © 2019 Pavel Bogart. All rights reserved.
//

import Foundation
import UIKit

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
        cv.backgroundColor = .green
        
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
        cell.imageView.image = #imageLiteral(resourceName: "album6")
        cell.titleLabel.text = trips[indexPath.row].tripName
        cell.locationLabel.text = trips[indexPath.row].location.country
//        cell.setup()
        

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width - 16, height: 300)
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

    
    
    private class TripTopViewCell: UICollectionViewCell {
        
        static let reuseID = "TripTopViewCell"
        
        init() {
            super.init(frame: .zero)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        
            setup()
        }
        
        lazy var width = frame.width
        
        let bgView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
            view.frame = .zero
            return view
        }()
        
        let titleLabel: UILabel = {
            let lbl = UILabel()
//            lbl.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
            lbl.textColor = .black
lbl.backgroundColor = .lightGray
            return lbl
        }()
        
        let locationLabel: UILabel = {
            let lbl = UILabel()
//            lbl.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
            lbl.textColor = .black
lbl.backgroundColor = .lightGray
            return lbl
        }()
        
        let costLabel: UILabel = {
            let lbl = UILabel()
//            lbl.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
            lbl.sizeToFit()
            return lbl
        }()
        
        lazy var imageView: UIImageView = {
            let iv = UIImageView()
//            iv.frame = CGRect(x: 0, y: 0, width: self.width, height: 200)
            iv.contentMode = .scaleAspectFill
            
            return iv
        }()
        
        
        func setup() {
            addSubview(bgView)
            bgView.addSubview(imageView)
//            addSubview(titleLabel)
//            addSubview(locationLabel)
//            addSubview(costLabel)
            
            bgView.setAnchor(top: topAnchor,
                             left: leftAnchor, leading: nil,
                             bottom: bottomAnchor,
                             right: rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            imageView.setAnchor(top: bgView.topAnchor,
                                left: bgView.leftAnchor,
                                leading: nil,
                                bottom: nil,
                                right: bgView.rightAnchor,
                                trailing: nil,
                                paddingTop: 0,
                                paddingLeft: 0,
                                paddingBottom: 0,
                                paddingRight: 0,
                                height: 200
            )

            let tripNameStackView = UIStackView(arrangedSubviews: [titleLabel, locationLabel])
            tripNameStackView.axis = .vertical
            tripNameStackView.distribution = .fillEqually
            
            tripNameStackView.spacing = 2
//            tripNameStackView.topAnchor.constraint(equalTo: bgView.bottomAnchor).isActive = true
//            tripNameStackView.translatesAutoresizingMaskIntoConstraints = false
            bgView.addSubview(tripNameStackView)
            tripNameStackView.setAnchor(top: imageView.bottomAnchor,
                                        left: contentView.leftAnchor,
                                        leading: nil,
                                        bottom: contentView.bottomAnchor,
                                        right: contentView.rightAnchor,
                                        trailing: nil ,
                                        paddingTop: 8,
                                        paddingLeft: 8,
                                        paddingBottom:0,// 8,
                                        paddingRight: 8
            )
            
            
            
//            tripNameStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//            tripNameStackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
            

//            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: titleLabel.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//            titleLabel.setAnchor(top: bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    
}


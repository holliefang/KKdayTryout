//
//  ViewController.swift
//  AlbumApp
//
//  Created by Pavel Bogart on 2/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let tripId = "tripId"
    let popDestId = "popDestId"
    let headerId = "headerId"

//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 16
//
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .purple
//        return cv
//    }()
    
    let collectionView = BaseCollectionView(scrollDirection: .vertical)

    let backgrounImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        return iv
    }()
    
//    lazy var width = view.frame.width


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellRegister()
        setupViews()
        
    }
    
    @objc func tap() {
        
    }
    
    func setupViews() {
        view.addSubview(backgrounImageView)
        view.addSubview(collectionView)
        
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, leading: nil, bottom: view.bottomAnchor, right: view.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        backgrounImageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, leading: nil, bottom: view.bottomAnchor, right: view.rightAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Find your bloody trip..."
        navigationItem.titleView = searchBar
        
        let notifyBtn = UIBarButtonItem(title: "Bite Me", style: .plain, target: self, action: #selector(tap))
        navigationItem.rightBarButtonItem = notifyBtn
        
    }
    
    fileprivate func cellRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PopCell.self, forCellWithReuseIdentifier: popDestId)
        collectionView.register(TripCell.self, forCellWithReuseIdentifier: tripId)
        collectionView.register(MyUICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MyUICollectionReusableView
        
        headerView.label.text = sectionArray[indexPath.section]
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 40)
        
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popDestId, for: indexPath)
            return cell as! PopCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tripId, for: indexPath) as! TripCell
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    
}

class MyUICollectionReusableView: UICollectionReusableView {
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





